import express from 'express';

import User from '../models/user.js';

const authRouter  = express.Router();

authRouter.post("/auth/register", async(req, res)=> {
    const {name, email, password} = req.body;

   try {
 // check existing email
    const existingEmail = await User.findOne({email: email});
    if(existingEmail){
        return res.status(400).json({error: "Email already exists"});
    }

 // create new user

    const user = new User({name, email, password});
    await user.save();

    res.status(201).json({message: "User registered successfully", user});

    }catch(e){
        res.status(500).json({error: "Failed to register user"});
    }
})

export default authRouter;