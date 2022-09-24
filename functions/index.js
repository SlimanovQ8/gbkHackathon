/* eslint-disable max-len */
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
exports.CarStatus = functions.firestore.document("Users/{test}")
    .onUpdate((change, context) => {
      console.log("test");
      const newValue = change.after.data();
      console.log(newValue);

      // Notification details.
      // eslint-disable-next-line max-len
      const payload = {
        notification: {
          title: "Car Accepted",
          tag: "CarStatus",
          click_action: "FLUTTER_NOTIFICATION_CLICK",
          // eslint-disable-next-line max-len

          // eslint-disable-next-line max-len
          body: "Hello ",
        },
        data: {
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "title": "Car Accepted",
          "tag": "CarStatus",
          "sound": "default",
          "status": "done",
          "screen": "MyCars",
          // eslint-disable-next-line max-len
          "body": "Hello ",
        },
      };

      const previousValue = change.before.data();
      console.log(previousValue);
      console.log(change.after.data);
      return admin.messaging().sendToDevice(newValue.deviceID, payload);
      // eslint-disable-next-line max-len
    });
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
