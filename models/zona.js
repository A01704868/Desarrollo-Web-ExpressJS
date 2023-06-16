
const db = require('../util/database');

module.exports = class Zona {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(nombreZona) {
        this.nombreZona = nombreZona;

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {

      return db.execute('INSERT INTO zonas (nombreZona) VALUES (?)',
        [this.nombreZona]
        );
        
    }

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll() {
        return db.execute('SELECT * FROM zonas')
          
        //return personas;
        
    }

    static fetchOne(zonaID) {
        return db.execute('SELECT * FROM zonas WHERE zonaID = ?', [zonaID]);
    }

    static delete(zonaID) {
        return db.execute('DELETE FROM zonas WHERE zonaID = ?', [zonaID]);
    }

    static fetch(criterio) {
        return db.execute('SELECT * FROM zonas WHERE zonaID LIKE ? OR nombreZona LIKE ?' , ['%'+criterio+'%','%'+criterio+'%']);
    }

}