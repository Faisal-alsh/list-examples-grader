import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.*;

public class TestListExamples {

  // Write your grading tests here!

  @Test
  public void testmerge() {
    List<String> input1 = Arrays.asList("1", "2");
    List<String> input2 = Arrays.asList("3");

    List<String> result = Arrays.asList("1", "2", "3");
    assertArrayEquals(result.toArray(), ListExamples.merge(input1, input2).toArray());

  }

  @Test(timeout = 100)
  public void test1() {
    List<String> list1 = new ArrayList<>(Arrays.asList("a"));
    List<String> list2 = new ArrayList<>(Arrays.asList("b"));
    assertEquals(new ArrayList<>(Arrays.asList("a", "b")),
        ListExamples.merge(list1, list2));
  }

 

  @Test(timeout = 1000)
  public void test3() {
    List<String> list1 = new ArrayList<>(Arrays.asList("a"));
    List<String> list2 = new ArrayList<>(Arrays.asList("a"));
    assertEquals(new ArrayList<>(Arrays.asList("a", "a")),
        ListExamples.merge(list1, list2));

  }

}
