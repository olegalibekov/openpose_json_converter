import 'dart:convert';
import 'package:flutter/services.dart';
import 'pose_model.dart';

List jsonCompilation = [];

addJsonData(String fileName) async {
  var jsonText = json.decode(
      await rootBundle.loadString('assets/json/$fileName.json'))['people'][0];
  List body = jsonText['pose_keypoints_2d'];

  Body poseModelBody = Body(
      neck: Neck(
          x: body[getBeginPointIndex(1)], y: body[getBeginPointIndex(1) + 1]),
      rightShoulder: Neck(
          x: body[getBeginPointIndex(2)], y: body[getBeginPointIndex(2) + 1]),
      rightElbow: Neck(
          x: body[getBeginPointIndex(3)], y: body[getBeginPointIndex(3) + 1]),
      rightWrist: Neck(
          x: body[getBeginPointIndex(4)], y: body[getBeginPointIndex(4) + 1]),
      leftShoulder: Neck(
          x: body[getBeginPointIndex(5)], y: body[getBeginPointIndex(5) + 1]),
      leftElbow: Neck(
          x: body[getBeginPointIndex(6)], y: body[getBeginPointIndex(6) + 1]),
      leftWrist: Neck(
          x: body[getBeginPointIndex(7)], y: body[getBeginPointIndex(7) + 1]),
      midThigh: Neck(
          x: body[getBeginPointIndex(8)], y: body[getBeginPointIndex(8) + 1]),
      rightHip: Neck(
          x: body[getBeginPointIndex(9)], y: body[getBeginPointIndex(9) + 1]),
      rightKnee: Neck(
          x: body[getBeginPointIndex(10)], y: body[getBeginPointIndex(10) + 1]),
      rightTopAnkle: Neck(
          x: body[getBeginPointIndex(11)], y: body[getBeginPointIndex(11) + 1]),
      rightTopAnkleAddition: Neck(
          x: body[getBeginPointIndex(24)], y: body[getBeginPointIndex(24) + 1]),
      rightFootstep: Neck(
          x: body[getBeginPointIndex(22)], y: body[getBeginPointIndex(22) + 1]),
      rightFootstepAddition: Neck(
          x: body[getBeginPointIndex(23)], y: body[getBeginPointIndex(23) + 1]),
      leftHip: Neck(
          x: body[getBeginPointIndex(12)], y: body[getBeginPointIndex(12) + 1]),
      leftKnee: Neck(
          x: body[getBeginPointIndex(13)], y: body[getBeginPointIndex(13) + 1]),
      leftTopAnkle: Neck(
          x: body[getBeginPointIndex(14)], y: body[getBeginPointIndex(14) + 1]),
      leftTopAnkleAddition: Neck(
          x: body[getBeginPointIndex(21)], y: body[getBeginPointIndex(21) + 1]),
      leftFootstep: Neck(
          x: body[getBeginPointIndex(19)], y: body[getBeginPointIndex(19) + 1]),
      leftFootstepAddition: Neck(
          x: body[getBeginPointIndex(20)],
          y: body[getBeginPointIndex(20) + 1]));

  List rightHandJson = jsonText['hand_right_keypoints_2d'];
  LeftHand rightHand = LeftHand(
    wrest: FaceEdges(
        x: rightHandJson[getBeginPointIndex(0)],
        y: rightHandJson[getBeginPointIndex(0) + 1]),
    thumb: [
      Point(
          x: rightHandJson[getBeginPointIndex(1)],
          y: rightHandJson[getBeginPointIndex(1) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(2)],
          y: rightHandJson[getBeginPointIndex(2) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(3)],
          y: rightHandJson[getBeginPointIndex(3) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(4)],
          y: rightHandJson[getBeginPointIndex(4) + 1])
    ],
    forefinger: [
      Point(
          x: rightHandJson[getBeginPointIndex(5)],
          y: rightHandJson[getBeginPointIndex(5) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(6)],
          y: rightHandJson[getBeginPointIndex(6) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(7)],
          y: rightHandJson[getBeginPointIndex(7) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(8)],
          y: rightHandJson[getBeginPointIndex(8) + 1])
    ],
    middleFinger: [
      Point(
          x: rightHandJson[getBeginPointIndex(9)],
          y: rightHandJson[getBeginPointIndex(9) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(10)],
          y: rightHandJson[getBeginPointIndex(10) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(11)],
          y: rightHandJson[getBeginPointIndex(11) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(12)],
          y: rightHandJson[getBeginPointIndex(12) + 1])
    ],
    ringFinger: [
      Point(
          x: rightHandJson[getBeginPointIndex(13)],
          y: rightHandJson[getBeginPointIndex(13) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(14)],
          y: rightHandJson[getBeginPointIndex(14) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(15)],
          y: rightHandJson[getBeginPointIndex(15) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(16)],
          y: rightHandJson[getBeginPointIndex(16) + 1])
    ],
    pinkie: [
      Point(
          x: rightHandJson[getBeginPointIndex(17)],
          y: rightHandJson[getBeginPointIndex(17) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(18)],
          y: rightHandJson[getBeginPointIndex(18) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(19)],
          y: rightHandJson[getBeginPointIndex(19) + 1]),
      Point(
          x: rightHandJson[getBeginPointIndex(20)],
          y: rightHandJson[getBeginPointIndex(20) + 1])
    ],
  );
  var poseModel =
      PoseModel(pose: Pose(body: poseModelBody, rightHand: rightHand)).toJson();
  jsonCompilation.add(poseModel);
}

getBeginPointIndex(int patternPoint) => patternPoint * 3;

jsonConverter() async {
  for (int jsonFileIndex = 0; jsonFileIndex < 6; jsonFileIndex++)
    await addJsonData('human_pose_points$jsonFileIndex');
  print(jsonCompilation);
}
