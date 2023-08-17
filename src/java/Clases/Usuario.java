package Clases;

/**
 *
 * @author Guillermo Jarana
 */
public class Usuario implements Comparable<Usuario>{

    //ATRIBUTOS
    private int cod_usuario;
    private String nombre, apellidos, nombreUsuario, contraseña;
    private int partidasJugadas, victorias;

    public Usuario() {
    }

    public Usuario(int cod_usuario, String nombre, String apellidos, String nombreUsuario, String contraseña, int partidasJugadas, int victorias) {
        this.cod_usuario = cod_usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.nombreUsuario = nombreUsuario;
        this.contraseña = contraseña;
        this.partidasJugadas = partidasJugadas;
        this.victorias = victorias;
    }

    public Usuario(int cod_usuario, String nombre, String apellidos, String nombreUsuario, String contraseña) {
        this.cod_usuario = cod_usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.nombreUsuario = nombreUsuario;
        this.contraseña = contraseña;
    }

    public Usuario(String nombre, String apellidos, String nombreUsuario, String contraseña) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.nombreUsuario = nombreUsuario;
        this.contraseña = contraseña;
    }

    public Usuario(String nombreUsuario, int partidasJugadas, int victorias) {
        this.nombreUsuario = nombreUsuario;
        this.partidasJugadas = partidasJugadas;
        this.victorias = victorias;
    }
    

    @Override
    public String toString() {
        return "Usuario{" + "cod_usuario=" + cod_usuario + ", nombre=" + nombre + ", apellidos=" + apellidos + ", nombreUsuario=" + nombreUsuario + ", contrase\u00f1a=" + contraseña + ", partidasJugadas=" + partidasJugadas + ", victorias=" + victorias + '}';
    }

    
    public String toString2() {
        return "Usuario: "+nombreUsuario+" Partidas jugadas: "+partidasJugadas+" Victorias: "+victorias;
    }

    public int getCod_usuario() {
        return cod_usuario;
    }

    public void setCod_usuario(int cod_usuario) {
        this.cod_usuario = cod_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getVictorias() {
        return victorias;
    }

    public void setVictorias(int victorias) {
        this.victorias = victorias;
    }

    public int getPartidasJugadas() {
        return partidasJugadas;
    }

    public void setPartidasJugadas(int partidasJugadas) {
        this.partidasJugadas = partidasJugadas;
    }

    @Override
    public int compareTo(Usuario u) {
       if(this.victorias==(u.getVictorias())){ //Si tienen el mismo nº de victorias
           //Ordena por número de partidas jugadas de menor a mayor
        return (this.partidasJugadas)-(u.getPartidasJugadas()); 
       }
       else{
        return (u.getVictorias())-(this.victorias); //Si no, lo ordena por nº de victorias de mayor a menor
       }
    }

}
