# Create your grading script here

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

# check if the ListExamples.java file matches the given specifications
if [ -e ListExamples.java ]
then
    echo "File was found"
else
    echo "The ListExamples.java file was not found"
    exit 1
fi

if ! [[ $? -eq 0 ]]
then
   echo "There is a compiler error."
   exit
else
   echo "Correctly compiled"
fi

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > result.txt

echo "TestListExamples ran"
cat result.txt
failure=$(grep -i "Tests that ran:" result.txt)

if [[ $failure == "" ]]
then
  echo "Good Job. All tests passed."
else
  echo "tests failed"
  echo $failure
fi
