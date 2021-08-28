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

