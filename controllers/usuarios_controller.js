const Usuario = require('../models/usuario');
const bcrypt = require('bcryptjs');

exports.logout = (request, response, next) => {
   request.session.destroy(() => {
        response.redirect('login'); //Este código se ejecuta cuando la sesión se elimina.
    });
};

exports.getNewUser = (request, response, next) => {
    
    Usuario.fetchAllRoles()
    .then(([roles, fieldData]) => {
        response.render('nuevo_usuario', {
          error: request.session.error === undefined ? false : request.session.error,
          titulo:"Nuevo usuario",
          roles: roles, 
          permisos: request.session.permisos
      });
          
    })
    .catch(err => {
           console.log(err);
    });
    /*
    response.render('nuevo_usuario', {
        error: request.session.error === undefined ? false : request.session.error, 
        titulo: "Nuevo usuario",
    });*/
};


exports.get=(request, response, next) => {
	response.setHeader('Set-Cookie', 'persona_cookie=Esto es para segiuir al personal; HttpOnly');
	console.log(request.cookies.persona_cookie);

	Usuario.tablaPersonas()
          .then(([usuarios, fieldData]) => {
             console.log(usuarios);

             response.render('personal', {
                usuarios: usuarios,
                exito_personal: request.session.ultimo_personal === undefined ? false : request.session.ultimo_personal, 
              permisos: request.session.permisos
            });
          })
          .catch(err => {
                 console.log(err);
          });


    
}

exports.postUsuario = (request, response, next) => {

    console.log("Petición asíncrona reciba");
    console.log(request.body);
    console.log(request.body.cuentaID);
    

    Usuario.delete(request.body.cuentaID)
        .then(() => {
             Usuario.tablaPersonas()
                .then(([usuarios, fieldData]) => {
                    return response.status(200).json({usuarios: usuarios});
                })
                .catch(err => {
                    console.log(err)
                });
            //return response.status(200).json({message: "Zona eliminada"});
        }).catch((err) => {
            console.log(err);
            return response.status(500).json({message: "Internal Server Error"});
        });
    //response.status(200).json({message: "Respuesta asíncrona"});
}

exports.postNewUser = (request, response, next) => {
    const usuario = new Usuario(request.body.nombre, request.body.correo, request.body.rol, request.body.contrasena);
    request.session.error = undefined;

    console.log(usuario);
    usuario.save()
        .then(() => {
            request.session.ultimo_personal = request.body.nombre;
            response.redirect('/usuarios/');
        }).catch( err => {
            console.log(err)
            request.session.error = "Ingresa otro nombre de usuario";
            response.redirect('new');    
        });
    
 };



exports.getLogin = (request, response, next) => {
    response.render('login', {  
        error: request.session.error === undefined ? false : request.session.error , 
        titulo: "UMA",
    });
};


exports.postBuscar =  (request, response, next) => {

    console.log("Petición asíncrona reciba");
    console.log(request.body.criterio);

    Usuario.fetch(request.body.criterio)
        .then(([usuarios, fieldData]) => {
            return response.status(200).json({usuarios: usuarios});
        })
        .catch(err => {
            console.log(err)
        });
        
 }

exports.postLogin = (request, response, next) => {
    request.session.error = undefined;

    Usuario.fetchOne(request.body.correo)
        .then(([rows, fieldData]) => {
            console.log(rows[0]);
            
            bcrypt.compare(request.body.contrasena, rows[0].contrasena)
                .then(doMatch => {
                    if (doMatch) {
                        request.session.isLoggedIn = true;
                        request.session.user = rows[0].correo;
                        Usuario.getPermisos(request.session.user)
                        
                        .then(([rows, fieldData]) => {
                            request.session.permisos =rows;
                             console.log(request.session.permisos);
                             return response.redirect('/');
                         }).catch (err => {
                             request.session.error ='Usuario y/o contraseña incorrectos';
                             return response.redirect('login');
                         });
                    }else{
                        request.session.error ='Usuario y/o contraseña incorrectos';
                        return response.redirect('login');
                    }
                }).catch(err => {
                    request.session.error ='Usuario y/o contraseña incorrectos';
                    return response.redirect('login');
                });

        }).catch(err => {
            console.log(err);
            request.session.error ='Usuario y/o contraseña incorrectos';
            return response.redirect('login');
        });


    
    
 };