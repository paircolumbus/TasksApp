$(document).ready(() => {

    let generateTaskHtml = (task) => {
        let completed = task.completed_at == null? ' ' : 'x';
        let completeButton = task.completed_at == null? `<button onclick="completeTask(${task.id})">Mark Complete</button>` : '';
        let deleteButton = `<button onclick="removeTask(${task.id})">Delete</button>`;
        return `<li>[${completed}] ${task.title} ${completeButton} ${deleteButton}</li>`;
    };

    let appendTask = (task) => {
        $('.todoList').append(generateTaskHtml(task))
    };
    let fetchTasks = (callback) => { 
        $.get('/tasks').then(callback);
    };

    let renderTasks = () => {
        fetchTasks(tasks => { 
            tasks.forEach((task) => {
                appendTask(task);
            });
        });
    };

    let refreshTasks = () => { 
        $('.todoList').empty();
        renderTasks();
    };

    let clearInputs = () => {
        $('input[name="description"]').val('');
        $('input[name="completed"]').prop('checked', false);
    };

    window.completeTask = (id) => { 
        $.ajax({
            url:`/tasks/${id}`, 
            method:'PUT', 
            data: { id, completed_at:new Date() }
        })
        .then(refreshTasks);
    };

    window.removeTask = (id) => { 
        $.ajax({
            url:`/tasks/${id}`, 
            method:'DELETE', 
            data: { id }
        })
        .then(refreshTasks);

    };
    window.createNew = () => {
        let title = $('input[name="description"]').val();
        let completed_at = $('input[name="completed"]').prop('checked')?new Date():null;
        $.post(`/tasks`,{title, completed_at}).then(clearInputs).then(refreshTasks);
    };
    renderTasks();
});