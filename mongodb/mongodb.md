## Mongobd


    show dbs
    use <db>
    db
    show collections


    db.collection.count()
    db.collection.find(printjson);
    db.collection.insert(doc);
    db.<collection>.find();
    db.<collection>.find().forEach(printjson)
    db.<collection>.findOne({ <field>: <value> })
    db.<collection>.find({'<field>': '<value>'})
    db.<collection>.find({'<field>': '</.*a.*>'})  #values start with 'a'


    db.<collection>.insert({ _id : 3})
    db.<collection>.find()[0]._id.getTimestamp()


    new Date
    new ObjectId


    # auto increment field
    function getNextSequence(name) {
    var ret = db.counters.findAndModify(
          {
              query: { _id: name },
              update: { $inc: { seq: 1 } },
              new: true,
              upsert: true
          }
      );
    return ret.seq;
    }

    db.<collection>.insert({"_id": getNextSequence("<collection"), "<field>": "<value>"})
