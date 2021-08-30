const express = require('express')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const db = require('../database/connection')

exports.register = async (req, res, next) => {
	let user;
	
	if((!req.body.name) || (!req.body.username) || (!req.body.password) || (!req.body.region) || (!req.body.major) || (!req.body.birthDate)) {
           return res.json({error: 'Enter all fields' })
	}
	
	await bcrypt.hash(req.body.password, 10, function(err,hash){
        if(err) throw err;
        user = {
        name: req.body.name,
        username: req.body.username,
        birthDate: req.body.birthDate,
        major: req.body.major,
        region: req.body.region,
        password: hash,
        email: req.body.email,
        phone: req.body.phone,
        }
    
    var sql = 'SELECT * FROM mydatabase.user WHERE username = ?';
    db.query(sql, [user.username], function (err, data, fields) {
    if(err) {
        return res.send('error: '+ err)
    }
    if(data.length > 1) {
        return res.json({error: 'User already exists.'})
    }
    else {
        var sql = 'INSERT INTO mydatabase.user SET ?';
        db.query(sql, user, function (err, row) {
            if(err) {
                return res.status(500).send(
                {
                    error: err
                });
            }
            return res.status(201).json(
            {
               message: 'User created successfully!',
               result: user,
            });
        });
        

        }
    });
});
}

exports.login = async (req, res, next) => {
    var username = req.body.username;
    var password = req.body.password;
    var sql='SELECT * FROM mydatabase.user WHERE username =?';
    db.query(sql, [username, password], function (err, data, fields) {
        if(err) {
            return res.status(401).json({ message : 'Authentication Failed!!'})
        }
        if(data.length>0){
            bcrypt.compare(password, data[0].password,function (err,res1) {
                if (!res1) {
                  return res.status(401).json({
                    message: 'Authentication Failed: Wrong Password.',
                  })
                } else {
                  //password match then we want to create the token
                  const token = jwt.sign({username: data[0].username, id: data[0].iduser}, 'secret-key', {
                    algorithm: 'HS256',
                    expiresIn: '1h',
                    subject: data[0].username
                  }); //this method create token and we give it the data we want to store
                  return res.status(201).json({
                    user: data[0],
                    token: token,
                  });
        }
    });
        }
        else{
            return res.status(401).json({message: "Authentication Failed : User not Found."});
    }});
}

exports.getPlants = async (req, res, next) => {
    
    var sql = "SELECT * FROM mydatabase.plant";
    db.query(sql, function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                plants: data,
    })
} 
})
}


exports.getSavedPlants = async (req, res, next) => {
    var userId = req.body.userid;
    var sql = "SELECT SP.idsavedPlant, SP.idplant, SP.personalizedName, SP.dateOfPlanting, SP.watering, P.name, P.imagePath, ";
    sql += "S.startDate, S.frequencyInterval, S.timeOfDay, S.endDate ";
    sql += "FROM mydatabase.savedplant SP, mydatabase.user U, mydatabase.plant P, mydatabase.schedule S WHERE SP.iduser=U.iduser AND U.iduser = ? ";
    sql  += "AND SP.idplant = P.idplant AND P.watering = S.idschedule";
    db.query(sql,[userId], function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {
            return res.status(201).json({
                plants: data,
            });
        }
    }
);
}

exports.getArticles = async(req, res, next) => {
    var sql = "SELECT * FROM mydatabase.article";
    db.query(sql, function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                articles: data,
            });
        }
    });
}

exports.getPlant = async(req, res, next) => {
    var idplant = req.body.plantid;
    var sql = "SELECT * FROM mydatabase.plant WHERE idplant =?";
    db.query(sql,[idplant] ,function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                plant : data[0],
            });
        }
    });
}

exports.getRelatedArticles = async(req, res, next) => {
    var idplant = req.body.idplant;
    var sql = "SELECT * FROM mydatabase.article A, mydatabase.relatedarticle R WHERE A.idarticle = R.articleID AND R.plantID =?";
    db.query(sql, [idplant],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                articles: data,
            });
        }
    });
}

exports.getRelatedInsects = async(req, res, next) => {
    var idplant = req.body.idplant;
    var sql = "SELECT * FROM mydatabase.insect A, mydatabase.relatedinsect R WHERE A.idinsect = R.id_insect AND R.id_plant =?";
    db.query(sql, [idplant],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                insects: data,
            });
        }
    });
}

exports.getRelatedDiseases = async(req, res, next) => {
    var idplant = req.body.idplant;
    var sql = "SELECT * FROM mydatabase.disease A, mydatabase.relateddisease R WHERE A.iddisease = R.diseaseKey AND R.plantKey =?";
    db.query(sql, [idplant],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                diseases: data,
            });
        }
    });
}

exports.addToGarden = async(req, res, next) => {
    var plantid =req.body.plantid;
    var addedName = req.body.addedName;
    var userid = req.body.userid;
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy+ '-' + mm + '-' + dd;
    var plant = {
        idplant: plantid,
        iduser: userid,
        personalizedName: addedName,
        dateOfPlanting: today,
        watering:1
        }
    var sql = "INSERT INTO mydatabase.savedplant SET ?";
    db.query(sql, plant, function (err, row) {
        if(err) {
            return res.status(500).send(
            {
                error: err
            });
        }
        return res.status(201).json(
        {
           message: 'New Plant, New Journey!',
          
        });
    });
}

exports.addNote= async(req, res, next) => {
    var description = req.body.description;
    var imagePath = req.body.imagePath;
    var reminder = req.body.reminder;
    var scheduleid = req.body.scheduleid;
    var title = req.body.title;
    var savedplantid = req.body.savedplantid;
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy+ '-' + mm + '-' + dd;
    var note = {
        description: description,
        imagePath: imagePath,
        date: today,
        reminder: reminder,
        scheduleid: scheduleid,
        title: title,
        savedplantid: savedplantid,
        }
    var sql = "INSERT INTO mydatabase.note SET ?";
    db.query(sql, note, function (err,result, fields) {
        if(err) {
            return res.status(500).send(
            {
                error: err
            });
        }
        return res.status(201).json(
        {
           message: 'New Note, Keep an eye!',
        });
    });
}

exports.addSchedule= async(req, res, next) => {
    var startDate = req.body.startDate;
    var frequencyInterval = req.body.frequencyInterval;
    var timeOfDay = req.body.timeOfDay;
    var endDate = req.body.endDate;

    var schedule = {
        startDate : startDate,
        frequencyInterval: frequencyInterval,
        timeOfDay: timeOfDay,
        endDate: endDate,
    }
    
    var sql = "INSERT INTO mydatabase.note SET ?";
    db.query(sql, schedule, function (err,result, fields) {
        if(err) {
            return res.status(500).send(
            {
                error: err
            });
        }
        return res.status(201).json(
        {
           message: 'Success!',
           scheduleid: result.insertId,
        });
    });
}

exports.getNotes = async(req, res, next) => {
    var savedplantid = req.body.savedplantid;
    var sql = "SELECT * FROM mydatabase.note WHERE savedplantid = ?";
    db.query(sql, [savedplantid],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                notes: data,
            });
        }
    });

}

exports.getAllNotes = async(req, res, next) => {
    var userid = req.body.userid
    var sql = "SELECT * FROM mydatabase.note N, mydatabase.savedplant S WHERE S.idsavedplant = N.savedplantid AND S.iduser = ? ";
    db.query(sql, [userid],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                notes: data,
            });
        }
    });

}

exports.editNote = async(req, res, next) => {
    var noteid = req.body.noteid;
    var description = req.body.description;
    var title = req.body.title;

    var sql = "UPDATE mydatabase.note SET title=?, description =? WHERE idnote=?";
    db.query(sql, [title, description, noteid],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                message: "Success!",
            });
        }
    });

}

exports.deleteNote = async(req, res, next) => {
    var noteid = req.body.noteid;

    var sql = "DELETE FROM mydatabase.note WHERE idnote = ?";
    db.query(sql, [noteid],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                message: "Success!",
            });
        }
    });
}

exports.deleteSavedPlant = async(req, res, next) => {
    var idsavedplant = req.body.idsavedplant;

    var sql = "DELETE FROM mydatabase.savedplant WHERE idsavedplant = ?";
    db.query(sql, [idsavedplant],function(err, data, fields) {
        if(err) {
            return res.send('error: '+ err);
        }
        else {   
            return res.status(201).json({
                message: "Success!",
            });
        }
    });
}