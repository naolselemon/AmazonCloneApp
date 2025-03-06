import mongoose from 'mongoose';

//Create user model
const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    email: {
        type: String,
        required: true,
        unique: true,
        trim: true,
        match: [/^[^\s@]+@[^\s@]+\.[^\s@]+$/, 'Please enter a valid email address'] // Email format validation]
    },
    password: {
        type: String,
        required: true,
        trim: true
    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: 'user',
    }
}, {timestamps: true});

const User = mongoose.model('User', userSchema);

export default User;