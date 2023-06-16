
const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Usuario {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(nombre, correo, rol, contrasena  ) {
        this.nombre = nombre;
        this.correo = correo;
        this.rol = rol;
        this.contrasena = contrasena;

    }

    //Este método servirá para guardar de manera persistente el nuevo objeto. 
    save() {
        //Dentro del método del modelo que crea el usuario
        //El segundo argumento es el número de veces que se aplica el algoritmo, actualmente 12 se considera un valor seguro
        //El código es asíncrono, por lo que hay que regresar la promesa
        return bcrypt.hash(this.contrasena, 12)
               .then( (contrasena) => {
                    return db.execute('INSERT INTO cuentas (nombre, correo, contrasena) values (?, ?, ?);',
                        [this.nombre, this.correo, contrasena]
                        ).then(()=>{
                            return db.execute('SELECT cuentaID FROM cuentas WHERE correo= ?;',
                                [this.correo]
                                ).then(([rows, fieldData]) => {
                                    //console.log(rows);
                                    let cuentaid=rows[0].cuentaID;
                                    console.log(cuentaid);
                                    return db.execute('INSERT INTO roles_cuentas (rollID, cuentaID) VALUES (?, ?)',
                                         [this.rol,cuentaid]);
                                    

                                }).catch(err => {
                                    console.log(err);
                                });

                        }).catch(err => {
                            console.log(err);
                        });


                        /*).then( () => {
                            return db.execute('INSERT INTO roles_cuentas (rollID, cuentaID, fecha) VALUES (?, NULL ,NULL)',
                            [this.rol]
                            );
                        }).catch(err => {
                            console.log(err);
                        });*/
                }).catch( err => {
                    console.log(err);
                    throw Error("Nombre de usuario duplicado");   
                });
        
    }

    

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll() {
        return db.execute('SELECT * FROM cuentas');
          
        //return personas;
        
    }

    static tablaPersonas() {
        return db.execute('SELECT C.cuentaID, C.nombre, C.correo, R.rol FROM cuentas C, roles_cuentas RC, roles R WHERE C.cuentaID=RC.cuentaID AND RC.rollID= R.rollID');
          
        
    }

    static fetchAllRoles() {
        return db.execute('SELECT * FROM roles');
          
        
    }
    

    static fetchOne(correo) {
        return db.execute('SELECT * FROM cuentas WHERE correo = ?', [correo]);
    }

    static delete(cuentaID) {
        return db.execute('DELETE FROM cuentas WHERE cuentaID = ?', [cuentaID]);
    }

    static fetch(criterio) {
        return db.execute('SELECT cuentas.cuentaID, cuentas.nombre, cuentas.correo, roles.rol FROM cuentas NATURAL JOIN roles_cuentas NATURAL JOIN roles WHERE  cuentas.correo LIKE ? OR cuentas.nombre LIKE ? OR roles.rol LIKE ?' , ['%'+criterio+'%','%'+criterio+'%','%'+criterio+'%']);
    }

    static getPermisos(correo) {
        return db.execute('SELECT P.permisosID FROM permisos P, permisos_roles PR, roles R, roles_cuentas RC, cuentas C WHERE P.permisosID=PR.permisosID AND PR.rollID= R.rollID AND R.rollID= RC.rollID AND RC.cuentaID=C.cuentaID AND C.correo=?', [correo]);
    }

}