docker run -d —name jenkins -p 8080:8080 -p 50000:50000 -v /Users/adqua/Desktop/jenkins:/var/jenkins_home jenkins/jenkins:lts

#fix 403 error
sudo chown -R 1000 /Users/adqua/Desktop/jenkins