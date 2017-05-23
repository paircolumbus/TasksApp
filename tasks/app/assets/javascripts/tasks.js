function Task(args) {
  this.id = args.id;
  this.title = args.title;
  this.completed = args.completed;
  if (args.updated_at) this.updated_at = new Date(args.updated_at);
  console.log(this);
};

Task.prototype.prettyPrintDate = function() {
  if (!this.updated_at) return '';
  month = this.updated_at.getMonth() + 1;
  day = this.updated_at.getDate();
  year = this.updated_at.getFullYear();
  return month + '/' + day + '/' + year;
};

Task.prototype.prettyPrintTime = function() {
  if (!this.updated_at) return '';
  hours = this.updated_at.getHours();
  minutes = ('0' + this.updated_at.getMinutes()).slice(-2);
  return hours + ':' + minutes;
};

Vue.component('task-row', {
  template: '#task-row',
  props: ['initialTask'],
  data: function() {
    return {
      editMode: false,
      errors: {},
      task: new Task(this.initialTask)
    };
  },
  methods: {
    editTask: function() {
      this.editMode = true;
    },
    updateTask: function() {
      var that = this;
      $.ajax({
        method: 'PUT',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: { task: that.task },
        url: '/tasks/' + that.task.id + '.json',
        success: function(res) {
          that.errors = {};
          that.task = new Task(res);
          that.editMode = false;
          Materialize.toast('Task updated!', 3000, 'green');
        },
        error: function(res) {
          console.log(res.responseText);
          that.errors = res.responseJSON.errors;
          Materialize.toast('Error updating task.', 3000, 'red');
        }
      });
    },
    deleteTask: function() {
      var that = this;
      $.ajax({
        method: 'DELETE',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/tasks/' + that.task.id + '.json',
        success: function(res) {
          taskList.tasks = taskList.tasks.filter(function(t) {
            return t.id != that.task.id;
          });
          Materialize.toast('Task deleted!', 3000, 'green');
        }
      });
    }
  }
});

var taskList = new Vue({
  el: '#task-list',
  data: {
    tasks: [],
    currTask: new Task({ id: null, title: '', completed: false }),
    errors: {}
  },
  mounted: function() {
    var that;
    that = this;
    $.ajax({
      url: '/tasks.json',
      success: function(res) {
        that.tasks = res;
      }
    });
  },
  methods: {
    createTask: function() {
      var that = this;
      $.ajax({
        method: 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {
          task: that.currTask
        },
        url: '/tasks.json',
        success: function(res) {
          that.errors = {};
          that.tasks.push(new Task(res));
          that.currTask = new Task({ id: null, title: '', completed: false });
          Materialize.toast('Task created!', 3000, 'green');
        },
        error: function(res) {
          console.log(res.responseText);
          console.log(res.responseJSON);
          that.errors = res.responseJSON.errors;
          Materialize.toast('Error creating task.', 3000, 'red');
        }
      });
    }
  }
});
