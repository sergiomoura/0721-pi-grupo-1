module.exports = (sequelize, DataTypes) => {

    let usuario = sequelize.define(
        "Usuario", // Nome do model
        {
            id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                allowNull: false,
                primaryKey: true
            },
            nome: {
                type: DataTypes.STRING,
                allowNull: false
            },
            email: {
                type: DataTypes.STRING,
                allowNull: false
            },
            senha: {
                type: DataTypes.STRING,
                allowNull: false
            },
            endereco: {
                type: DataTypes.STRING,
                allowNull: true
            },
            genero: {
                type: DataTypes.INTEGER,
                allowNull: false
            },
            celular: {
                type: DataTypes.STRING(15),
                allowNull: false
            }
        },
        
        {
            tableName: "usuario",
            timestamps: false,
            paranoid: false
        }
    );



    return usuario;

}