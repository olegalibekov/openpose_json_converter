import 'dart:convert';
import 'package:flutter/services.dart';
import 'pose_model.dart';
import 'dart:html' as html;

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
      ]);

  List leftHandJson = jsonText['hand_left_keypoints_2d'];
  LeftHand leftHand = LeftHand(
      wrest: FaceEdges(
          x: leftHandJson[getBeginPointIndex(0)],
          y: leftHandJson[getBeginPointIndex(0) + 1]),
      thumb: [
        Point(
            x: leftHandJson[getBeginPointIndex(1)],
            y: leftHandJson[getBeginPointIndex(1) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(2)],
            y: leftHandJson[getBeginPointIndex(2) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(3)],
            y: leftHandJson[getBeginPointIndex(3) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(4)],
            y: leftHandJson[getBeginPointIndex(4) + 1])
      ],
      forefinger: [
        Point(
            x: leftHandJson[getBeginPointIndex(5)],
            y: leftHandJson[getBeginPointIndex(5) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(6)],
            y: leftHandJson[getBeginPointIndex(6) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(7)],
            y: leftHandJson[getBeginPointIndex(7) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(8)],
            y: leftHandJson[getBeginPointIndex(8) + 1])
      ],
      middleFinger: [
        Point(
            x: leftHandJson[getBeginPointIndex(9)],
            y: leftHandJson[getBeginPointIndex(9) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(10)],
            y: leftHandJson[getBeginPointIndex(10) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(11)],
            y: leftHandJson[getBeginPointIndex(11) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(12)],
            y: leftHandJson[getBeginPointIndex(12) + 1])
      ],
      ringFinger: [
        Point(
            x: leftHandJson[getBeginPointIndex(13)],
            y: leftHandJson[getBeginPointIndex(13) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(14)],
            y: leftHandJson[getBeginPointIndex(14) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(15)],
            y: leftHandJson[getBeginPointIndex(15) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(16)],
            y: leftHandJson[getBeginPointIndex(16) + 1])
      ],
      pinkie: [
        Point(
            x: leftHandJson[getBeginPointIndex(17)],
            y: leftHandJson[getBeginPointIndex(17) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(18)],
            y: leftHandJson[getBeginPointIndex(18) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(19)],
            y: leftHandJson[getBeginPointIndex(19) + 1]),
        Point(
            x: leftHandJson[getBeginPointIndex(20)],
            y: leftHandJson[getBeginPointIndex(20) + 1])
      ]);

  List faceJson = jsonText['face_keypoints_2d'];
  Face face = Face(
      faceEdges: [
        for (int faceEdgeIndex = 0; faceEdgeIndex < 27; faceEdgeIndex++)
          FaceEdges(
              x: faceJson[getBeginPointIndex(faceEdgeIndex)],
              y: faceJson[getBeginPointIndex(faceEdgeIndex) + 1]),
      ],
      rightEye: LeftEye(
          pupil: FaceEdges(
              x: faceJson[getBeginPointIndex(68)],
              y: faceJson[getBeginPointIndex(68) + 1]),
          edges: [
            Point(
                x: faceJson[getBeginPointIndex(36)],
                y: faceJson[getBeginPointIndex(36) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(37)],
                y: faceJson[getBeginPointIndex(37) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(38)],
                y: faceJson[getBeginPointIndex(38) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(39)],
                y: faceJson[getBeginPointIndex(39) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(40)],
                y: faceJson[getBeginPointIndex(40) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(41)],
                y: faceJson[getBeginPointIndex(41) + 1])
          ]),
      leftEye: LeftEye(
          pupil: FaceEdges(
              x: faceJson[getBeginPointIndex(69)],
              y: faceJson[getBeginPointIndex(69) + 1]),
          edges: [
            Point(
                x: faceJson[getBeginPointIndex(42)],
                y: faceJson[getBeginPointIndex(42) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(43)],
                y: faceJson[getBeginPointIndex(43) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(44)],
                y: faceJson[getBeginPointIndex(44) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(45)],
                y: faceJson[getBeginPointIndex(45) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(46)],
                y: faceJson[getBeginPointIndex(46) + 1]),
            Point(
                x: faceJson[getBeginPointIndex(47)],
                y: faceJson[getBeginPointIndex(47) + 1])
          ]),
      nasalPartition: [
        Point(
            x: faceJson[getBeginPointIndex(27)],
            y: faceJson[getBeginPointIndex(27) + 1]),
        Point(
            x: faceJson[getBeginPointIndex(28)],
            y: faceJson[getBeginPointIndex(28) + 1]),
        Point(
            x: faceJson[getBeginPointIndex(29)],
            y: faceJson[getBeginPointIndex(29) + 1]),
        Point(
            x: faceJson[getBeginPointIndex(30)],
            y: faceJson[getBeginPointIndex(30) + 1])
      ],
      nose: [
        Point(
            x: faceJson[getBeginPointIndex(31)],
            y: faceJson[getBeginPointIndex(31) + 1]),
        Point(
            x: faceJson[getBeginPointIndex(32)],
            y: faceJson[getBeginPointIndex(32) + 1]),
        Point(
            x: faceJson[getBeginPointIndex(33)],
            y: faceJson[getBeginPointIndex(33) + 1]),
        Point(
            x: faceJson[getBeginPointIndex(34)],
            y: faceJson[getBeginPointIndex(34) + 1]),
        Point(
            x: faceJson[getBeginPointIndex(35)],
            y: faceJson[getBeginPointIndex(35) + 1])
      ],
      mouth: Mouth(externalEdges: [
        for (int mouthEdgeIndex = 48; mouthEdgeIndex < 60; mouthEdgeIndex++)
          Point(
              x: faceJson[getBeginPointIndex(mouthEdgeIndex)],
              y: faceJson[getBeginPointIndex(mouthEdgeIndex) + 1]),
      ], internalEdges: [
        for (int mouthEdgeIndex = 60; mouthEdgeIndex < 68; mouthEdgeIndex++)
          Point(
              x: faceJson[getBeginPointIndex(mouthEdgeIndex)],
              y: faceJson[getBeginPointIndex(mouthEdgeIndex) + 1])
      ]));

  var poseModel = PoseModel(
          pose: Pose(
              face: face,
              body: poseModelBody,
              rightHand: rightHand,
              leftHand: leftHand))
      .toJson();
  jsonCompilation.add(poseModel);
}

getBeginPointIndex(int patternPoint) => patternPoint * 3;

jsonConverter() async {
  for (int jsonFileIndex = 0; jsonFileIndex < 1; jsonFileIndex++)
    await addJsonData('human_pose_points_$jsonFileIndex');
  final formattedJson = jsonCompilation.toString().replaceAllMapped(RegExp(r'\b\w+\b'), (match) {
    String word = '${match.group(0)}';
    return !word.startsWith(RegExp('^[0-9]'))?'"${match.group(0)}"':'4';
  });
  // var resultJson = jsonCompilation.toString().replaceAll('pose', '"pose"').replaceA('face', '"face"');
  print(formattedJson);
  // downloadFile(resultJson);
}

downloadFile(String jsonText) {
  final text = jsonCompilation.toString();
  final bytes = utf8.encode(text);
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = 'human_pose.json';
  html.document.body.children.add(anchor);
  anchor.click();
  html.document.body.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
