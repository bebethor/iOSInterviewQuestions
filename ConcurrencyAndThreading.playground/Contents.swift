import UIKit

/* https://www.avanderlee.com/swift/concurrent-serial-dispatchqueue/ */

/* Concurrent vs Serial DispatchQueue: Concurrency in Swift explained */

/* Concurrent and Serial queues help us to manage how we execute tasks and help to make our applications run faster, more efficiently, and with improved responsiveness. We can create queues easily using the DispatchQueue class which is built on top of the Grand Central Dispatch (GCD) queue.

   The benefit of dispatch queues is that they’re a lot simpler to understand and more efficient at executing tasks on different threads compared to the lower level GCD threading code. Still, there’s a lot to learn, so let’s dive into the differences between concurrent and serial queues.
 
 
 
  What is a dispatch queue?
 
  A DispatchQueue is an abstraction layer on top of the GCD queue that allows you to perform tasks asynchronously and concurrently in your application. Tasks are always executed in the order they’re added to the queue.

  What is a serial queue?
 
  A serial Dispatch Queue performs only one task at the time. Serial queues are often used to synchronize access to a specific value or resource to prevent data races to occur.

  Creating a serial dispatch queue
  A DispatchQueue defaults to a serial queue and can be initialized as follows: */

//let serialQueue = DispatchQueue(label: "swiftlee.serial.queue")
//
//serialQueue.async {
//    print("Task 1 started")
//    // Do some work..
//    print("Task 1 finished")
//}
//serialQueue.async {
//    print("Task 2 started")
//    // Do some work..
//    print("Task 2 finished")
//}

/* As you can see, the second task only starts after the first task is finished. */


/* What is a concurrent queue?
 
A concurrent queue allows us to execute multiple tasks at the same time. Tasks will always start in the order they’re added but they can finish in a different order as they can be executed in parallel. Tasks will run on distinct threads that are managed by the dispatch queue. The number of tasks running at the same time is variable and depends on system conditions.

Creating a concurrent dispatch queue
 
A concurrent dispatch queue can be created by passing in an attribute as a parameter to the DispatchQueue initializer: */

let concurrentQueue = DispatchQueue(label: "swiftlee.concurrent.queue", attributes: .concurrent)

concurrentQueue.async {
    print("Task 1 started")
    // Do some work..
    print("Task 1 finished")
}
concurrentQueue.async {
    print("Task 2 started")
    // Do some work..
    print("Task 2 finished")
}

/* As you can see, the second task already starts before the first task is finished. This means that both tasks have run in parallel. */


/* The best of both worlds
In some cases, it’s valuable to benefit from the concurrent queue to perform multiple tasks at the same time while still preventing data races. This is possible by making use of a so-called barrier. Before we dive in, it’s good to know what a data race exactly is.

What is a data race?
A data race can occur when multiple threads access the same memory without synchronization and at least one access is a write. You could be reading values from an array from the main thread while a background thread is adding new values to that same array.

Data races can be the root cause behind flaky tests and weird crashes. Therefore, it’s good practice to regularly spend time using the Thread Sanitizer ---> https://twitter.com/twannl/status/1192781427978493952?s=20

Using a barrier on a concurrent queue to synchronize writes
A barrier flag can be used to make access to a certain resource or value thread-safe. We synchronize write access while we keep the benefit of reading concurrently.

The following code demonstrates a messenger class that can be accessed from multiple threads at the same time. Adding new messages to the array is done using the barrier flag and blocks and new reads until the write is finished. */

final class Messenger {

    private var messages: [String] = []

    private var queue = DispatchQueue(label: "messages.queue", attributes: .concurrent)

    var lastMessage: String? {
        return queue.sync {
            messages.last
        }
    }

    func postMessage(_ newMessage: String) {
        queue.sync(flags: .barrier) {
            messages.append(newMessage)
        }
    }
}

let messenger = Messenger()
// Executed on Thread #1
messenger.postMessage("Hello SwiftLee!")
// Executed on Thread #2
print(messenger.lastMessage ?? "Messenger instance is nil") // Prints: Hello SwiftLee!
