const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const rutasRoot = require('./routes/root');
const rutasEspecies = require('./routes/especies');
const rutasZonas = require('./routes/zonas');
const rutasUsuarios = require('./routes/usuarios');
const rutasInventarios = require('./routes/inventarios');
const multer = require('multer');

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use(cookieParser());

app.use(session({
    secret: 'a2jwejnirfkmci0j23fewrrmcowssr', 
    resave: false, //La sesión no se guardará en cada petición, sino sólo se guardará si algo cambió 
    saveUninitialized: false, //Asegura que no se guarde una sesión para una petición que no lo necesita
}));

const path = require('path');
const csrf = require('csurf');
const csrfProtection = csrf();

const csrfMiddleware = require('./util/csrf');

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');

//fileStorage: Es nuestra constante de configuración para manejar el almacenamiento
const fileStorage = multer.diskStorage({
    destination: (request, file, callback) => {
        //'uploads': Es el directorio del servidor donde se subirán los archivos 
        callback(null, 'uploads');
    },
    filename: (request, file, callback) => {
        //aquí configuramos el nombre que queremos que tenga el archivo en el servidor, 
        //para que no haya problema si se suben 2 archivos con el mismo nombre concatenamos el timestamp
        callback(null, new Date().getMilliseconds() + '_' +  file.originalname);
    },
});

app.use(multer({ storage: fileStorage }).single('imagen')); 
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));


app.use(csrfProtection); 
app.use(csrfMiddleware);

app.use('/especies', rutasEspecies);
app.use('/zonas', rutasZonas);
app.use('/usuarios', rutasUsuarios);
app.use('/inventarios', rutasInventarios);

app.use('/',rutasRoot);

app.use((request, response, next) => {
	console.log('Error 404');
	response.status(404);
    response.send('<h1>Página no disponible</h1>'); //Manda la respuesta
});

app.listen(3000);