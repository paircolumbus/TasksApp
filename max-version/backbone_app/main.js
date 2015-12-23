module.exports = function(Backbone){
  var TaskApp = new Backbone.Marionette.Application();

  var Task = Backbone.Model.extend({
    idAttribute: '_id',
    url: '/tasks'
  });

  var Tasks = Backbone.Collection.extend({

    model: Task,

    urlRoot: '/tasks',
    url: '/tasks'

  });

  var TaskView = Backbone.Marionette.ItemView.extend({
    template: '#item',

    onBeforeRender: function () {
      console.log('hi');
      console.log(this.model);
    },

    events: {
      'keyup input': function(e){

        this.model.set('text', e.target.value);
        this.model.save();
        console.log(this.model);
      },
      'change #box': function(e){
        this.model.set('isDone', e.target.checked);
        this.model.save();
        console.log(e.target.checked);
      }
    }
  });

  var FormView = Backbone.Marionette.ItemView.extend({
    template: '#form-item',

    onBeforeRender: function(){
      this.model = new TaskApp.TaskModel();
    },

    events: {
      'keyup #text': function(e){

        this.model.set('text', e.target.value);
        console.log(this.model);
      },
      'click #button': function(e){

        this.model.set('isDone', false);


        this.model.save();

        TaskApp.tasks.add(this.model);

        console.log(e.target.checked);



        this.$el[0].children[0].value = '';

        this.model = new TaskApp.TaskModel();
      }
    }
  });

  var TasksCollectionView = Backbone.Marionette.CollectionView.extend({
    childView: TaskView
  });


  TaskApp.addRegions({
    list: '#list',
    form: '#form'
  });

  TaskApp.addInitializer(function(){
    TaskApp.tasks = new Tasks();
    TaskApp.TaskModel = Task;
    TaskApp.tasks.fetch();
    window.TaskApp = TaskApp;
    TaskApp.list.show(new TasksCollectionView({collection: TaskApp.tasks}));

    TaskApp.form.show(new FormView());
  });


  TaskApp.start();


};
