function gotData() {
    firebase.auth().onAuthStateChanged((user) => {
        if (user) {
            var useruid = user.uid;
            //console.log(useruid);
        } 
        else {
            // window.alert("No user is signed in");
        }

        firebase.database().ref('users/'+useruid).once('value').then(function (snapshot){
            var usern = snapshot.val().username;
            document.getElementById("user_param").innerHTML = usern.charAt(0).toUpperCase() + usern.slice(1);
            document.getElementById("weight_param").innerHTML = "Weight: " + snapshot.val().weight + " lbs";
            document.getElementById("height_param").innerHTML = "Height: " + snapshot.val().height_ft + "\'" + snapshot.val().height_in + "\"";
            document.getElementById("time_param").innerHTML = "I work out for " + snapshot.child('time').val() + " minutes a day.";

            var str = "";
            var workoutDays = util.daysDB_Arr(snapshot.child('days'));
            var dayCount = workoutDays.length;
            for(i = 0; i < dayCount; i++) {
                if(dayCount >= 1 && i == dayCount - 1) str = str + "and ";
                str = str + workoutDays[i];
                if(dayCount - i > 1) { if(dayCount > 2) str = str + ","; str = str + " "; }
                if(dayCount - i == 1) str = str + ".";
            }
            document.getElementById("day_param").innerHTML = "I work out on " + str;

            str = "Goal: ";
            switch(snapshot.child('goal').val()) {
                case 0:
                    str = str + "Burn fat and lose weight!";
                    break;
                case 1:
                    str = str + "Tone my body and look great!";
                    break;
                case 2:
                    str = str + "Get some GAINS!!";
                    break;
            }
            document.getElementById("goal_param").innerHTML = str;
        })
    });
}

function logout(){
    firebase.auth().signOut();
    window.location.href = "index.html";
}