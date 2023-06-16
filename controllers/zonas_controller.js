
const Zona = require('../models/zona');

exports.getNuevaZona=(request, response, next) => {

	response.render('form_zonas',{
        permisos: request.session.permisos
    });

}

exports.postNuevaZona=(request, response, next) => {
   console.log(request.body);
   const zona = new Zona(request.body.nombreZona);
   zona.save()
      .then(() => {
        request.session.ultima_zona = request.body.nombreZona;
        response.redirect('/zonas');
      }).catch( err => {
           console.log(err);
           response.redirect('/zonas/zonas');    
      });
}

exports.get=(request, response, next) => {
	response.setHeader('Set-Cookie', 'persona_cookie=Esto es para segiuir al personal; HttpOnly');
	console.log(request.cookies.persona_cookie);

	Zona.fetchAll()
          .then(([rows, fieldData]) => {
             console.log(rows);

             response.render('zona', {
              zonas: rows,
              exito_zona: request.session.ultima_zona === undefined ? false : request.session.ultima_zona, 
              permisos: request.session.permisos
            });
          })
          .catch(err => {
                 console.log(err);
          });


    
}

exports.getezona=(request, response, next) => {
  const zonaID = request.params.zonaID;

  Zona.fetchOne()
          .then(([rows, fieldData]) => {
             console.log(rows);

             response.render('zona', {
              zona: rows,
              exito_zona: request.session.ultima_zona === undefined ? false : request.session.ultima_zona, 
              permisos: request.session.permisos
            });
          })
          .catch(err => {
                 console.log(err);
          });


    
}


exports.postZona = (request, response, next) => {

    console.log("Petición asíncrona reciba");
    console.log(request.body);
    console.log(request.body.zonaID);
    

    Zona.delete(request.body.zonaID)
        .then(() => {
             Zona.fetchAll()
                .then(([rows, fieldData]) => {
                    return response.status(200).json({zonas: rows});
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

exports.postBuscar =  (request, response, next) => {

    console.log("Petición asíncrona reciba");
    console.log(request.body.criterio);

    Zona.fetch(request.body.criterio)
        .then(([rows, fieldData]) => {
            return response.status(200).json({zonas: rows});
        })
        .catch(err => {
            console.log(err)
        });
        
 }