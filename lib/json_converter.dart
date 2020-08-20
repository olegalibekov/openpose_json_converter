import 'dart:convert';
import 'package:flutter/services.dart';
import 'pose_model.dart';

loadJsonData() async {
  var jsonText = json.decode(await rootBundle
      .loadString('assets/json/human_pose_points0.json'))['people'][0];
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

  var poseModel = PoseModel(pose: Pose(body: poseModelBody)).toJson();
  print(poseModel);
}

getBeginPointIndex(int patternPoint) => patternPoint * 3;

jsonConverter() async {
  await loadJsonData();
}
