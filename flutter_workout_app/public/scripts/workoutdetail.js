var today;
var workoutday;

function loadWorkout(idx) {
    const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']; 
    document.getElementById('day_header').innerHTML = weekdays[idx];
    firebase.auth().onAuthStateChanged((user) => {
        if (user) var useruid = user.uid; 
        else window.alert("No user is signed in");

        firebase.database().ref('users/'+useruid).once('value').then(function (snapshot){

            workoutday = -1;
            if(!snapshot.child('days').child(idx).val()) { console.log('rest day!'); return; }
            for(i = 0; i <= idx; i++) if(snapshot.child('days').child(i).val()) workoutday++;
            var dayplan = snapshot.child('weekplan').child(workoutday);

            const pre = "<li>\n"
            const youtubePrefix = "<iframe class = \"tutorial\" src= \"";
            const youtubePostfix = "\" allowfullscreen = \"allowfullscreen\"></iframe>\n";
            const titlePrefix = "<h3 class = \"h3\">";
            const titlePostfix = "</h3>\n";
            const intstPre1fix = "<label class = \"ipt_label\">";
            const intstPre2fix = "\n<input class = \"intensity_ipt\" type = \"number\" id = \"intensity";
            const intstMidfix = "\" value = ";
            const intstPostfix = "></label>\n";
            const paraPrefix = "<p>";
            const paraPostfix = "</p>\n";
            const finishBtnPrefix = "<button class = \"complete_btn\" onclick = \"finish(";
            const finishBtnPostfix = ");\">Complete</button>\n";
            const finishStrBtnPrefix = "<button class = \"complete_btn\" onclick = \"finishStr(";
            const unmutablePrefix = "<p class = \"unmutable_intensity\">";
            const unmutablePostfix = "</p>\n";
            const post = "\n</li>\n\n";
            var type_no;
            var outstr = "";
            var exercise;
            for(i = 0; i < dayplan.numChildren(); i++) {
                exercise = dayplan.child(i);
                outstr += pre;

                if(exercise.hasChild('tutorial')) 
                    outstr += youtubePrefix + "" + exercise.val().tutorial + youtubePostfix;

                exercise = exercise.val();

                outstr += titlePrefix + exercise.name + titlePostfix;

                if(exercise.type == 'cardio')
                    if(exercise.speed != 0) type_no = 0;
                    else type_no = 1;

                else if(exercise.type == 'bodyweight')
                    if(exercise.procedure == 'repitition') type_no = 2;
                    else type_no = 3;

                else if(exercise.type == 'strength') type_no = 4;
                
                switch(type_no) {
                    // Cardio with speed
                    case 0:
                        outstr += intstPre1fix + "Speed" + intstPre2fix + i + intstMidfix + exercise.speed + intstPostfix;
                        outstr += paraPrefix + "Muscle groups: " + exercise.muscles + paraPostfix;
                        outstr += paraPrefix + exercise.type + paraPostfix;
                        outstr += finishBtnPrefix + i + ',\'speed\'' + finishBtnPostfix;
                        outstr += unmutablePrefix + "Time: " + exercise.time + unmutablePostfix;
                        break;

                    // Cardio with no speed
                    case 1:
                        outstr += paraPrefix + "Muscle groups: " + exercise.muscles + paraPostfix;
                        outstr += paraPrefix + exercise.type + paraPostfix;
                        outstr += unmutablePrefix + "Time: " + exercise.time + unmutablePostfix;
                        break;

                    // Bodyweight repitition
                    case 2:
                        outstr += intstPre1fix + "Reps" + intstPre2fix + i + intstMidfix + exercise.reps + intstPostfix;
                        outstr += paraPrefix + "Muscle groups: " + exercise.muscles + paraPostfix;
                        outstr += paraPrefix + exercise.type + paraPostfix;
                        outstr += finishBtnPrefix + i + ',\'reps\'' + finishBtnPostfix;
                        outstr += unmutablePrefix + "Sets: " + exercise.sets + unmutablePostfix;
                        break;

                    // Bodyweight seconds
                    case 3:
                        outstr += intstPre1fix + "Seconds" + intstPre2fix + i + intstMidfix + exercise.time + intstPostfix;
                        outstr += paraPrefix + "Muscle groups: " + exercise.muscles + paraPostfix;
                        outstr += paraPrefix + exercise.type + paraPostfix;
                        outstr += finishBtnPrefix + i + ',\'time\'' + finishBtnPostfix;
                        outstr += unmutablePrefix + "Sets: " + exercise.sets + unmutablePostfix;
                        break;

                    // Strength
                    case 4:
                        outstr += intstPre1fix + "Reps" + intstPre2fix + i + "0" + intstMidfix + exercise.reps + intstPostfix;
                        outstr += intstPre1fix + "Weight" + intstPre2fix + i + "1" + intstMidfix + exercise.weight + intstPostfix;
                        outstr += paraPrefix + "Muscle groups: " + exercise.muscles + paraPostfix;
                        outstr += paraPrefix + exercise.type + paraPostfix;
                        outstr += finishStrBtnPrefix + i + finishBtnPostfix;
                        outstr += unmutablePrefix + "Sets: " + exercise.sets + unmutablePostfix;
                        break;
                }
                outstr += post;
                if(i == (dayplan.numChildren()-1)) writeWorkout();
            }

            function writeWorkout() { 
                document.getElementById("list").innerHTML = outstr;

            }
        });
    });
}

/*
*   Speed
*   Reps
*   Seconds
*   Weight
*/


function finish(idx, attr) {
    firebase.auth().onAuthStateChanged((user) => {
        if (user) var useruid = user.uid; 
        else window.alert("No user is signed in");
        firebase.database().ref('users/'+useruid+'/weekplan/'+workoutday+'/'+idx+'/'+attr).set(
            parseInt(document.getElementById('intensity'+idx).value)
        );
    });
}

function finishStr(idx) {
    firebase.auth().onAuthStateChanged((user) => {
        if (user) var useruid = user.uid; 
        else window.alert("No user is signed in");
        firebase.database().ref('users/'+useruid+'/weekplan/'+workoutday+'/'+idx+'/reps').set(
            parseInt(document.getElementById('intensity'+idx+'0').value)
        );
        firebase.database().ref('users/'+useruid+'/weekplan/'+workoutday+'/'+idx+'/weight').set(
            parseInt(document.getElementById('intensity'+idx+'1').value)
        );
    });
}

function getDay() {
    today = parseInt(decodeURIComponent(window.location.search).charAt(5));
    return today;
}