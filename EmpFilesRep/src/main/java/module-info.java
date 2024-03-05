module com.example.empfilesrep {
    requires javafx.controls;
    requires javafx.fxml;
            
                            
    opens com.example.empfilesrep to javafx.fxml;
    exports com.example.empfilesrep;
}