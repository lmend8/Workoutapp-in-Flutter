function questionnaire(){
    var height;
    var weight;
    var goal = 1;
    var days = new Array(7);
    var time = 45;
    var body_fat = 2;
    var shoulders = 2;
    var legs = 2;
    var arms = 2;
    var back = 2;
    var chest = 2;

    var heightfeet = parseInt(document.getElementById('height-feet').value);
    var heightinches = parseInt(document.getElementById('height-inches').value);
    
    height = ((12*heightfeet) + heightinches) * 0.0254 // conversion to meters

    weight = parseInt(document.getElementById('weight').value);

    var ele = document.getElementsByName('goal');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) 
        goal = i;
    }

    var ele = document.getElementsByName('day');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) 
            days[i] = true;
        else
            days[i] = false;
    }

    var ele = document.getElementsByName('time');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) {
            time = parseInt(ele[i].value);
        }
    }
    
    var ele = document.getElementsByName('body_fat');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) {
            body_fat = (2-i)+1;
        }
    }

    var ele = document.getElementsByName('shoulder');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) {
            shoulders = (2-i)+1;
        }
    }

    var ele = document.getElementsByName('legs');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) {
            legs = (2-i)+1;
        }
    }

    var ele = document.getElementsByName('arms');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) {
            arms = (2-i)+1;
        }
    }

    var ele = document.getElementsByName('back');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) {
            back = (2-i)+1;
        }
    }

    var ele = document.getElementsByName('chest');
    for(i = 0; i < ele.length; i++) { 
        if(ele[i].checked) {
            chest = (2-i)+1;
        }
    }

    const database = firebase.database();
    const ref = database.ref('users');
    const auth = firebase.auth();

    firebase.auth().onAuthStateChanged((user) => {
        if (user) {
            var useruid = user.uid;
        } 
        else {
            window.alert("No user is signed in");
        }
  
        firebase.database().ref('users/'+useruid).once('value').then(function (snapshot){
            ref.child(useruid).set({
              username: snapshot.val().username,
              email: snapshot.val().email, 
              weight: weight,
              height_ft: heightfeet,
              height_in: heightinches,
              height : height,
              time : time,
              goal : goal,
              days : days,
              body_fat : body_fat,
              shoulders : shoulders,
              back : back,
              legs : legs,
              arms : arms,
              chest : chest,
              first : false
            });
            location.replace("welcome.html");
        });
      });

}