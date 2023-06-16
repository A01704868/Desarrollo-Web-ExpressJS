const Planta = require('../models/planta');
const Especie = require('../models/especie');
const Zona = require('../models/zona');

exports.getSemillas=(request, response, next) => {

	response.render('inventario',{titulo:'Inventario Semilla', 
	permisos: request.session.permisos});
}

exports.getPlantasMadre=(request, response, next) => {

	response.render('inventario',{titulo:'Inventario Plantas Madre', 
	permisos: request.session.permisos});
}

exports.getAgregar=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {
			  Zona.fetchAll()
				.then(([zonas, fieldData]) => {
					response.render('registrarPlanta', {
						zonas: zonas,
						especies: especies, 
						permisos: request.session.permisos
					});
				}).catch(err => {
					console.log(err);
				});
          })
          .catch(err => {
                 console.log(err);
          });
}


exports.postAgregar=(request, response, next) => {
	const planta = new Planta(request.body.razon, request.body.zona, request.body.especie);

	planta.save()
		.then( () => {
			response.redirect('/inventarios/semillas');
		}).catch( (err) => {
			console.log(err);
			response.redirect('/');	
		});
}
//plantas madre
exports.getPlantasMadreAlta=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {
			  response.render('plantasMadreAlta', {
				titulo:'Alta de Planta Madre',
				especies: especies, 
				permisos: request.session.permisos
			});
          })
          .catch(err => {
                 console.log(err);
          });
	
}

exports.postPlantasMadreAlta=(request, response, next) => {

	const madre = new Planta(request.body.razon, request.body.zona, request.body.especie);

	for(let i = 0; i<request.body.cantidad; i++){
		madre.savePlantasMadre();
	}

	response.redirect('/');
}

exports.getBuscarMadre=(request, response, next) => {

	Planta.fetchBuscarPlantasMadre(request.params.especie, request.params.fecha)
				  .then(([rows, fieldData]) => {
					  return response.status(200).json({info: rows});
			  }).catch(err => console.log(err));
}

exports.getPlantasMadreBaja=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {
			  Planta.fetchResumenPlantasMadre()
			  	.then(([info,fieldData]) => {
					response.render('plantasMadreBaja', {
						titulo:'Baja de planta Madre',
						especies: especies,
						info: info,
						permisos: request.session.permisos
					});
				  }).catch(err => {console.log(err)});
          })
          .catch(err => {
                 console.log(err);
          });
}

exports.postPlantasMadreBaja=(request, response, next) => {

	Planta.bajarPlantasMadre(request.body.razon, request.body.minimo, request.body.maximo)
		.then(() => {
			response.redirect('/');
		}).catch(err => {onsole.log(err)});
}


//plantas
exports.getPlantasAlta=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {
			  response.render('plantasAlta', {
				titulo:'Alta de planta',
				especies: especies, 
				permisos: request.session.permisos
			});
          })
          .catch(err => {
                 console.log(err);
          });
}

exports.postPlantasAlta=(request, response, next) => {
	const planta = new Planta(request.body.razon, request.body.zona, request.body.especie);

	for(let i = 0; i<request.body.cantidad; i++){
		planta.savePlantas();
	}

	response.redirect('/');
}

exports.getPlantasBaja=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {

			  Planta.fetchResumenPlantas()
			  	.then(([info,fieldData]) => {
					response.render('plantasBaja', {
						titulo:'Baja de planta',
						especies: especies,
						info: info,
						permisos: request.session.permisos
					});
				  }).catch(err => {console.log(err)});

          })
          .catch(err => {
                 console.log(err);
          });
}

exports.getBuscarPlantas=(request, response, next) => {

	console.log('especie:' + request.params.especie + ' fecha:'+request.params.fecha);
  
	Planta.fetchBuscarPlantas(request.params.especie, request.params.fecha)
				  .then(([rows, fieldData]) => {
					  return response.status(200).json({info: rows});
			  }).catch(err => console.log(err));
  }

exports.postPlantasBaja=(request, response, next) => {

		Planta.bajarPlantas(request.body.razon, request.body.minimo, request.body.maximo)
			.then(() => {
				response.redirect('/');
			}).catch(err => {onsole.log(err)});
}

//Semillas
exports.getSemillasAlta=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {
			  response.render('semillaAlta', {
				titulo:'Alta de semillas',
				especies: especies, 
				permisos: request.session.permisos
			});
				
          })
          .catch(err => {
                 console.log(err);
          });
}

exports.postSemillasAlta=(request, response, next) => {
	const semilla = new Planta(request.body.razon, 2, request.body.especie);

	for(let i = 0; i<request.body.cantidad; i++){
		semilla.saveLotesSemillas();
	}

	response.redirect('/');
}

exports.getSemillasBaja=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {

			  Planta.fetchResumenSemillas()
			  	.then(([info,fieldData]) => {
					response.render('semillaBaja', {
						titulo:'Baja de Semillas',
						especies: especies,
						info: info,
						permisos: request.session.permisos
					});
				  }).catch(err => {console.log(err)});

          })
          .catch(err => {
                 console.log(err);
          });
}


exports.postSemillasBaja=(request, response, next) => {

	Planta.bajarSemillas(request.body.razon, request.body.minimo, request.body.maximo)
			.then(() => {
				response.redirect('/');
			}).catch(err => {onsole.log(err)});

}

exports.getBuscarSemillas=(request, response, next) => {

	Planta.fetchBuscarSemillas(request.params.especie, request.params.fecha)
		.then(([rows, fieldData]) => {
			return response.status(200).json({info: rows});
		}).catch(err => console.log(err));

}

exports.getPlantulasAlta=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {
			  response.render('plantulasAlta', {
				titulo:'Alta de plantula',
				especies: especies, 
				permisos: request.session.permisos
			});
				
          })
          .catch(err => {
                 console.log(err);
          });
}

exports.postPlantulasAlta=(request, response, next) => {
	const planta = new Planta(request.body.razon, 1, request.body.especie);

	for(let i = 0; i<request.body.cantidad; i++){
		planta.saveLotesPlantula();
	}
	
	response.redirect('/');
}

exports.getBuscarPlantulas=(request, response, next) => {

	Planta.fetchBuscarPlantulas(request.params.especie, request.params.fecha)
		.then(([rows, fieldData]) => {
			return response.status(200).json({info: rows});
		}).catch(err => console.log(err));

}

exports.getPlantulasBaja=(request, response, next) => {

	Especie.fetchAll()
          .then(([especies, fieldData]) => {

			  Planta.fetchResumenPlantulas()
			  	.then(([info,fieldData]) => {
					response.render('plantulasBaja', {
						titulo:'Baja de Plantula',
						especies: especies,
						info: info,
						permisos: request.session.permisos
					});
				  }).catch(err => {console.log(err)});

          })
          .catch(err => {
                 console.log(err);
          });

}

exports.postPlantulasBaja=(request, response, next) => {

	Planta.bajarPlantulas(request.body.razon, request.body.minimo, request.body.maximo)
			.then(() => {
				response.redirect('/');
			}).catch(err => {console.log(err)});

}

