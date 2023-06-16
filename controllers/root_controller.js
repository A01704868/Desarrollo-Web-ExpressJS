const Planta = require('../models/planta');

exports.get=(request, response, next) => {
    Planta.fetchTarjetas()
      .then(([t,fieldData]) => {
        response.render('pagina_principal', {
          tarjetas: t, 
          permisos: request.session.permisos
        })
      })
      .catch(err => {
        console.log(err);
      });
}

exports.getBuscar=(request, response, next) => {
  
  Planta.fetch(request.params.criterio)
                .then(([rows, fieldData]) => {
                    return response.status(200).json({tarjetas: rows});
            }).catch(err => console.log(err));
}