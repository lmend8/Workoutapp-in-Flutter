function signUp(){

    const database = firebase.database();
    const ref = database.ref('users');
    const auth = firebase.auth();
  
    var email = document.getElementById("email");
    var password = document.getElementById("password");
    var username = document.getElementById("username");

    if(document.getElementById("password").value == document.getElementById("password_check").value) {
      firebase.auth().createUserWithEmailAndPassword(email.value, password.value).then((user) => {
        firebase.auth().onAuthStateChanged((user) => {
              // User logged in already or has just logged in.
              var useruid = user.uid;
              ref.child(useruid).set({
                username: username.value,
                email: email.value,
                first : true,
                user_exercises : null
              });
              location.replace("index.html");
          });
      })
      .catch((error) => {
      var errorCode = error.code;
      var errorMessage = error.message;
      window.alert(errorMessage);
      });
    }else {
      document.getElementById("no_match").innerHTML = "Passwords do not match";
    }
}