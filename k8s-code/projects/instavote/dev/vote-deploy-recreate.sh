apiVersion: apps/v1
kind: Deployment
metadata:
  name: vote
spec:
  strategy:
    type: Recreate
  revisionHistoryLimit: 4
  paused: false
  replicas: 15
  minReadySeconds: 20
  selector:
    matchLabels:
      role: vote
    matchExpressions:
      - {key: version, operator: In, values: [v1, v2, v3, v4]}
  template:
    metadata:
      name: vote
      labels:
        app: python
        role: vote
        version: v4
    spec:
      containers:
        - name: app
          image: schoolofdevops/vote:v4
          ports:
            - containerPort: 80
              protocol: TCP
