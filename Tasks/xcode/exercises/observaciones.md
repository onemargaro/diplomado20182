# Cambios

* Se quitó un boton, y un UITextField
* Se corriguieron los errores detectados de la siguiente manera

# Errores Detectados

* 'NSUnknownKeyException' :
  * Explicación: El error sucedio debido a la conexión del storyboard con el ViewController
  ```swift
    // Error:
    weak var outtletText: UITextField!
    // Correguido:
    @IBOutlet weak var outletText: UITextField!
  ```
  * Errores:
    * Faltaba @IBOutlet para la conexión con el storyboard
    * Error de typo outtletText -> outletText
* 'NSInvalidArgumentException' :
  * Explicación: El error sucedio debido a la conexión del storyboard con el ViewController
  ```swift
    // func actionButton(_ sender: Any) {
    // Error: Faltaba el @IBAction
    @IBAction func actionButton(_ sender: Any) {
        outletText.text = "You are a genius "
    }
  ```
  * Errores:
    * Faltaba @IBAction para indicar que es una acción conectada al storyboard
