# Create your grading script here
rm -rf student-submission
git clone --quiet $1 student-submission
cp TestListExamples.java student-submission
cd student-submission

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

failure=$(grep -i "Failures:" result.txt)
tests=$(head -n 2 result.txt | tail -n 1 | grep -o "\." | wc -l)


if [[ $failure == "" ]]
then
  echo "All tests passed. Good Job."
else
  echo "Failed tests:" 
  echo $failure
fi
