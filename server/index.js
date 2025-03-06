import express from 'express';
import mongoose from 'mongoose';
import dotenv from 'dotenv';
import authRouter from './routes/auth.js';

dotenv.config();
const PORT = process.env.PORT || 3000;

const app = express();
app.use(express.json());

// Routes
app.use(authRouter);


// Connect to MongoDB
mongoose.connect(process.env.MONGO_URL).then(()=> {
    console.log("Connected to MongoDB");
}).catch((error)=>{
console.error("Error connecting to MongoDB: ", error);
});

app.listen(PORT, "0.0.0.0",()=>{
    console.log(`Server is running on port ${PORT}`);
})
