
const Especie = require('../models/especie');

exports.getNuevaEspecie=(request, response, next) => {

	response.render('form_especie',{
         permisos: request.session.permisos
    });

}

exports.postNuevaEspecie=(request, response, next) => {
   console.log(request.body);
   const especie = new Especie(request.body.EspID,request.body.NombreEsp, request.file.path);
   especie.save()
      .then(() => {
        request.session.ultima_especie = request.body.NombreEsp;
        response.redirect('/especies');
      }).catch( err => {
           console.log(err);
           response.redirect('/especies/especies');    
      });
}

exports.get=(request, response, next) => {
	response.setHeader('Set-Cookie', 'persona_cookie=Esto es para segiuir al personal; HttpOnly');
	console.log(request.cookies.persona_cookie);

	Especie.fetchAll()
          .then(([rows, fieldData]) => {
             console.log(rows);

             response.render('registrarEspecie', {
              especies: rows,
              exito: request.session.ultima_especie === undefined ? false : request.session.ultima_especie, 
              permisos: request.session.permisos
            });
          })
          .catch(err => {
                 console.log(err);
          });


    
}

exports.getespecie=(request, response, next) => {
  const EspID = request.params.EspID;

  Persona.fetchOne()
          .then(([rows, fieldData]) => {
             console.log(rows);

             response.render('registrarEspecie', {
              especies: rows,
              exito: request.session.ultima_especie === undefined ? false : request.session.ultima_especie, 
              permisos: request.session.permisos
            });
          })
          .catch(err => {
                 console.log(err);
          });


    
}


exports.postEspecie = (request, response, next) => {

    console.log("Petición asíncrona reciba");
    console.log(request.body);
    console.log(request.body.EspID);
    

    Especie.delete(request.body.EspID)
        .then(() => {
             Especie.fetchAll()
                .then(([rows, fieldData]) => {
                    return response.status(200).json({especies: rows});
                })
                .catch(err => {
                    console.log(err)
                });
            //return response.status(200).json({message: "Especie eliminada"});
        }).catch((err) => {
            console.log(err);
            return response.status(500).json({message: "Internal Server Error"});
        });
    //response.status(200).json({message: "Respuesta asíncrona"});
}

exports.postBuscar =  (request, response, next) => {

    console.log("Petición asíncrona reciba");
    console.log(request.body.criterio);

    Especie.fetch(request.body.criterio)
        .then(([rows, fieldData]) => {
            return response.status(200).json({especies: rows});
        })
        .catch(err => {
            console.log(err)
        });
        
 }