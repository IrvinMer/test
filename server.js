const express = require('express');
const mysql = require('mysql2/promise');
const path = require('path');
require('dotenv').config();

const app = express();
app.use(express.json());

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Set up EJS as the view engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');


//root router
const rootRouter = require('./routes/root_rt'); // Import the root router
app.use('/', rootRouter); // Use the root router for requests to the root path

// auth router
const authRouter = require('./routes/auth_rt'); // Import the auth router
app.use('/auth', authRouter); // Use the auth router for requests to the /auth path

// shop router
const shopRouter = require('./routes/shop_rt'); // Import the shop router
app.use('/shop', shopRouter); // Use the shop router for requests to the /shop path

// myprofile router
const myprofileRouter = require('./routes/myprofile_rt'); // Import the myprofile router
app.use('/myprofile', myprofileRouter); // Use the myprofile router for requests to the /myprofile path

// Start the server
const HOST = '0.0.0.0'; // any IP address from the host machine can access the server
const PORT = process.env.PORT || 3000; // default to port 3000 if the PORT environment variable is not set

app.listen(PORT, HOST, () => {
  console.log(`Server is running at http://${HOST}:${PORT}`);
});

