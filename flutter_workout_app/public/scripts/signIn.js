function signIn(){
  var email = document.getElementById("email").value;
  var password = document.getElementById("password").value;

  const database = firebase.database();
  const ref = database.ref('users');
  const auth = firebase.auth();

  firebase.auth().signInWithEmailAndPassword(email, password)
  .then((user) => {
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
          var useruid = user.uid;
      } 
      else {
        window.alert("Something went wrong")
      }
      firebase.database().ref('users/'+useruid).once('value').then(function (snapshot){
        if(snapshot.val().first == true){
          ref.child(useruid).set({
            username: snapshot.val().username,
            email: snapshot.val().email,
            first: snapshot.val().first
            /*
            weight: snapshot.val().weight,
            height: snapshot.val().height,
            age: snapshot.val().age,
            gender: snapshot.val().gender,
            first : false
            */
          });
          location.replace("questionnaire.html");
        }
        else {
          location.replace("welcome.html");
        }
      })
  });
  })
  .catch((error) => {
    var errorCode = error.code;
    var errorMessage = error.message;
    window.alert(errorMessage);
  });
}
