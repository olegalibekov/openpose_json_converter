class PoseModel {
  Pose pose;

  PoseModel({this.pose});

  PoseModel.fromJson(Map<String, dynamic> json) {
    pose = json['pose'] != null ? new Pose.fromJson(json['pose']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pose != null) {
      data['pose'] = this.pose.toJson();
    }
    return data;
  }
}

class Pose {
  Face face;
  Body body;
  LeftHand leftHand;
  LeftHand rightHand;

  Pose({this.face, this.body, this.leftHand, this.rightHand});

  Pose.fromJson(Map<String, dynamic> json) {
    face = json['face'] != null ? new Face.fromJson(json['face']) : null;
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    leftHand = json['leftHand'] != null
        ? new LeftHand.fromJson(json['leftHand'])
        : null;
    rightHand = json['rightHand'] != null
        ? new LeftHand.fromJson(json['rightHand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.face != null) {
      data['face'] = this.face.toJson();
    }
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    if (this.leftHand != null) {
      data['leftHand'] = this.leftHand.toJson();
    }
    if (this.rightHand != null) {
      data['rightHand'] = this.rightHand.toJson();
    }
    return data;
  }
}

class Face {
  List<FaceEdges> faceEdges;
  LeftEye leftEye;
  LeftEye rightEye;
  List<Point> nasalPartition;
  List<Point> nose;
  Mouth mouth;

  Face(
      {this.faceEdges,
      this.leftEye,
      this.rightEye,
      this.nasalPartition,
      this.nose,
      this.mouth});

  Face.fromJson(Map<String, dynamic> json) {
    if (json['faceEdges'] != null) {
      faceEdges = new List<FaceEdges>();
      json['faceEdges'].forEach((v) {
        faceEdges.add(new FaceEdges.fromJson(v));
      });
    }
    leftEye =
        json['leftEye'] != null ? new LeftEye.fromJson(json['leftEye']) : null;
    rightEye = json['rightEye'] != null
        ? new LeftEye.fromJson(json['rightEye'])
        : null;
    if (json['nasalPartition'] != null) {
      nasalPartition = new List<Point>();
      json['nasalPartition'].forEach((v) {
        nasalPartition.add(new Point.fromJson(v));
      });
    }
    if (json['nose'] != null) {
      nose = new List<Point>();
      json['nose'].forEach((v) {
        nose.add(new Point.fromJson(v));
      });
    }
    mouth = json['mouth'] != null ? new Mouth.fromJson(json['mouth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.faceEdges != null) {
      data['faceEdges'] = this.faceEdges.map((v) => v.toJson()).toList();
    }
    if (this.leftEye != null) {
      data['leftEye'] = this.leftEye.toJson();
    }
    if (this.rightEye != null) {
      data['rightEye'] = this.rightEye.toJson();
    }
    if (this.nasalPartition != null) {
      data['nasalPartition'] =
          this.nasalPartition.map((v) => v.toJson()).toList();
    }
    if (this.nose != null) {
      data['nose'] = this.nose.map((v) => v.toJson()).toList();
    }
    if (this.mouth != null) {
      data['mouth'] = this.mouth.toJson();
    }
    return data;
  }
}

class FaceEdges {
  double x;
  double y;

  FaceEdges({this.x, this.y});

  FaceEdges.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class LeftEye {
  FaceEdges pupil;
  List<Point> edges;

  LeftEye({this.pupil, this.edges});

  LeftEye.fromJson(Map<String, dynamic> json) {
    pupil =
        json['pupil'] != null ? new FaceEdges.fromJson(json['pupil']) : null;
    if (json['edges'] != null) {
      edges = new List<Point>();
      json['edges'].forEach((v) {
        edges.add(new Point.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pupil != null) {
      data['pupil'] = this.pupil.toJson();
    }
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mouth {
  List<Point> externalEdges;
  List<Point> internalEdges;

  Mouth({this.externalEdges, this.internalEdges});

  Mouth.fromJson(Map<String, dynamic> json) {
    if (json['externalEdges'] != null) {
      externalEdges = new List<Point>();
      json['externalEdges'].forEach((v) {
        externalEdges.add(new Point.fromJson(v));
      });
    }
    if (json['internalEdges'] != null) {
      internalEdges = new List<Point>();
      json['internalEdges'].forEach((v) {
        internalEdges.add(new Point.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalEdges != null) {
      data['externalEdges'] =
          this.externalEdges.map((v) => v.toJson()).toList();
    }
    if (this.internalEdges != null) {
      data['internalEdges'] =
          this.internalEdges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  Neck neck;
  Neck leftShoulder;
  Neck rightShoulder;
  Neck leftElbow;
  Neck rightElbow;
  Neck leftWrist;
  Neck rightWrist;
  Neck midThigh;
  Neck leftHip;
  Neck rightHip;
  Neck leftKnee;
  Neck rightKnee;
  Neck leftTopAnkle;
  Neck rightTopAnkle;
  Neck leftTopAnkleAddition;
  Neck rightTopAnkleAddition;
  Neck leftFootstep;
  Neck rightFootstep;
  Neck leftFootstepAddition;
  Neck rightFootstepAddition;

  Body(
      {this.neck,
      this.leftShoulder,
      this.rightShoulder,
      this.leftElbow,
      this.rightElbow,
      this.leftWrist,
      this.rightWrist,
      this.midThigh,
      this.leftHip,
      this.rightHip,
      this.leftKnee,
      this.rightKnee,
      this.leftTopAnkle,
      this.rightTopAnkle,
      this.leftTopAnkleAddition,
      this.rightTopAnkleAddition,
      this.leftFootstep,
      this.rightFootstep,
      this.leftFootstepAddition,
      this.rightFootstepAddition});

  Body.fromJson(Map<String, dynamic> json) {
    neck = json['neck'] != null ? new Neck.fromJson(json['neck']) : null;
    leftShoulder = json['leftShoulder'] != null
        ? new Neck.fromJson(json['leftShoulder'])
        : null;
    rightShoulder = json['rightShoulder'] != null
        ? new Neck.fromJson(json['rightShoulder'])
        : null;
    leftElbow =
        json['leftElbow'] != null ? new Neck.fromJson(json['leftElbow']) : null;
    rightElbow = json['rightElbow'] != null
        ? new Neck.fromJson(json['rightElbow'])
        : null;
    leftWrist =
        json['leftWrist'] != null ? new Neck.fromJson(json['leftWrist']) : null;
    rightWrist = json['rightWrist'] != null
        ? new Neck.fromJson(json['rightWrist'])
        : null;
    midThigh =
        json['midThigh'] != null ? new Neck.fromJson(json['midThigh']) : null;
    leftHip =
        json['leftHip'] != null ? new Neck.fromJson(json['leftHip']) : null;
    rightHip =
        json['rightHip'] != null ? new Neck.fromJson(json['rightHip']) : null;
    leftKnee =
        json['leftKnee'] != null ? new Neck.fromJson(json['leftKnee']) : null;
    rightKnee =
        json['rightKnee'] != null ? new Neck.fromJson(json['rightKnee']) : null;
    leftTopAnkle = json['leftTopAnkle'] != null
        ? new Neck.fromJson(json['leftTopAnkle'])
        : null;
    rightTopAnkle = json['rightTopAnkle'] != null
        ? new Neck.fromJson(json['rightTopAnkle'])
        : null;
    leftTopAnkleAddition = json['leftTopAnkleAddition'] != null
        ? new Neck.fromJson(json['leftTopAnkleAddition'])
        : null;
    rightTopAnkleAddition = json['rightTopAnkleAddition'] != null
        ? new Neck.fromJson(json['rightTopAnkleAddition'])
        : null;
    leftFootstep = json['leftFootstep'] != null
        ? new Neck.fromJson(json['leftFootstep'])
        : null;
    rightFootstep = json['rightFootstep'] != null
        ? new Neck.fromJson(json['rightFootstep'])
        : null;
    leftFootstepAddition = json['leftFootstepAddition'] != null
        ? new Neck.fromJson(json['leftFootstepAddition'])
        : null;
    rightFootstepAddition = json['rightFootstepAddition'] != null
        ? new Neck.fromJson(json['rightFootstepAddition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.neck != null) {
      data['neck'] = this.neck.toJson();
    }
    if (this.leftShoulder != null) {
      data['leftShoulder'] = this.leftShoulder.toJson();
    }
    if (this.rightShoulder != null) {
      data['rightShoulder'] = this.rightShoulder.toJson();
    }
    if (this.leftElbow != null) {
      data['leftElbow'] = this.leftElbow.toJson();
    }
    if (this.rightElbow != null) {
      data['rightElbow'] = this.rightElbow.toJson();
    }
    if (this.leftWrist != null) {
      data['leftWrist'] = this.leftWrist.toJson();
    }
    if (this.rightWrist != null) {
      data['rightWrist'] = this.rightWrist.toJson();
    }
    if (this.midThigh != null) {
      data['midThigh'] = this.midThigh.toJson();
    }
    if (this.leftHip != null) {
      data['leftHip'] = this.leftHip.toJson();
    }
    if (this.rightHip != null) {
      data['rightHip'] = this.rightHip.toJson();
    }
    if (this.leftKnee != null) {
      data['leftKnee'] = this.leftKnee.toJson();
    }
    if (this.rightKnee != null) {
      data['rightKnee'] = this.rightKnee.toJson();
    }
    if (this.leftTopAnkle != null) {
      data['leftTopAnkle'] = this.leftTopAnkle.toJson();
    }
    if (this.rightTopAnkle != null) {
      data['rightTopAnkle'] = this.rightTopAnkle.toJson();
    }
    if (this.leftTopAnkleAddition != null) {
      data['leftTopAnkleAddition'] = this.leftTopAnkleAddition.toJson();
    }
    if (this.rightTopAnkleAddition != null) {
      data['rightTopAnkleAddition'] = this.rightTopAnkleAddition.toJson();
    }
    if (this.leftFootstep != null) {
      data['leftFootstep'] = this.leftFootstep.toJson();
    }
    if (this.rightFootstep != null) {
      data['rightFootstep'] = this.rightFootstep.toJson();
    }
    if (this.leftFootstepAddition != null) {
      data['leftFootstepAddition'] = this.leftFootstepAddition.toJson();
    }
    if (this.rightFootstepAddition != null) {
      data['rightFootstepAddition'] = this.rightFootstepAddition.toJson();
    }
    return data;
  }
}

class Neck {
  double x;
  double y;
  double confidence;

  Neck({this.x, this.y, this.confidence});

  Neck.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['confidence'] = this.confidence;
    return data;
  }
}

class LeftHand {
  FaceEdges wrest;
  List<Point> thumb;
  List<Point> forefinger;
  List<Point> middleFinger;
  List<Point> ringFinger;
  List<Point> pinkie;

  LeftHand(
      {this.wrest,
      this.thumb,
      this.forefinger,
      this.middleFinger,
      this.ringFinger,
      this.pinkie});

  LeftHand.fromJson(Map<String, dynamic> json) {
    wrest =
        json['wrest'] != null ? new FaceEdges.fromJson(json['wrest']) : null;
    if (json['thumb'] != null) {
      thumb = new List<Point>();
      json['thumb'].forEach((v) {
        thumb.add(new Point.fromJson(v));
      });
    }
    if (json['forefinger'] != null) {
      forefinger = new List<Point>();
      json['forefinger'].forEach((v) {
        forefinger.add(new Point.fromJson(v));
      });
    }
    if (json['middleFinger'] != null) {
      middleFinger = new List<Point>();
      json['middleFinger'].forEach((v) {
        middleFinger.add(new Point.fromJson(v));
      });
    }
    if (json['ringFinger'] != null) {
      ringFinger = new List<Point>();
      json['ringFinger'].forEach((v) {
        ringFinger.add(new Point.fromJson(v));
      });
    }
    if (json['pinkie'] != null) {
      pinkie = new List<Point>();
      json['pinkie'].forEach((v) {
        pinkie.add(new Point.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wrest != null) {
      data['wrest'] = this.wrest.toJson();
    }
    if (this.thumb != null) {
      data['thumb'] = this.thumb.map((v) => v.toJson()).toList();
    }
    if (this.forefinger != null) {
      data['forefinger'] = this.forefinger.map((v) => v.toJson()).toList();
    }
    if (this.middleFinger != null) {
      data['middleFinger'] = this.middleFinger.map((v) => v.toJson()).toList();
    }
    if (this.ringFinger != null) {
      data['ringFinger'] = this.ringFinger.map((v) => v.toJson()).toList();
    }
    if (this.pinkie != null) {
      data['pinkie'] = this.pinkie.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Point {
  double x;
  double y;
  double confidence;

  Point({this.x, this.y, this.confidence});

  Point.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['confidence'] = this.confidence;
    return data;
  }
}
