# mypms/app

This folder contains the javascript files for the application.

# mypms/resources

This folder contains static resources (typically an `"images"` folder as well).

# mypms/overrides

This folder contains override classes. All overrides in this folder will be 
automatically included in application builds if the target class of the override
is loaded.

# mypms/sass/etc

This folder contains misc. support code for sass builds (global functions, 
mixins, etc.)

# mypms/sass/src

This folder contains sass files defining css rules corresponding to classes
included in the application's javascript code build.  By default, files in this 
folder are mapped to the application's root namespace, 'mypms'. The
namespace to which files in this directory are matched is controlled by the
app.sass.namespace property in mypms/.sencha/app/sencha.cfg. 

# mypms/sass/var

This folder contains sass files defining sass variables corresponding to classes
included in the application's javascript code build.  By default, files in this 
folder are mapped to the application's root namespace, 'mypms'. The
namespace to which files in this directory are matched is controlled by the
app.sass.namespace property in mypms/.sencha/app/sencha.cfg. 
