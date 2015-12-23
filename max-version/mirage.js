var express = require('express');
var _ = require('lodash');

module.exports = function(app, mongo_model, query, reqAccess, middleware){
    var router = express.Router();

    //add middleware
    for (var i = 0; i < middleware.length; i++) {
        router.use(middleware[i]);
    }

    //get all
    router.get('/', function (req, res) {
        mongo_model.find({}, function(err, docs){
            if (err){
                res.send('an error occured');
            }
            res.send(docs);
        });
        //res.send('jello');
    });

    router.get('/:id', function (req, res) {
        var id = req.params.id;
        mongo_model.findById(id, function(err, doc){
            if (err){
                res.send('an error occured');
            }
            res.send(doc);
        });
    });

    router.post('/', function (req, res) {
        mongo_model.create(reqAccess(req), function(err, doc){
            if (err){
                res.send('an error occured' + reqAccess(req) + err);
            }
            res.send(doc);
        });
    });

    router.delete('/:id', function(req, res){
        var id = req.params.id;
        mongo_model.remove({_id: id}, function(err, doc){
            if (err){
                res.send('an error occured');
            }
            res.send(doc);
        });
    });

    router.put('/:id', function(req, res){
        var id = req.params.id;
        mongo_model.findById(id, function(err, doc){
            if (err){
                res.send('an error occured');
            }
            var edit = reqAccess(req);
            _.forEach(edit, function(value, key){
                //console.log(key, value);
                if (value !== 'undefined'){
                    doc[key] = value;
                }
            });
            doc.save();
            res.send(doc);
        });
    });

    console.log(app);
    console.log(router);

    app.use(query, router);
};
