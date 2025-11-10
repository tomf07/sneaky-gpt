# Sneaky GPT

A tiny Raycast script that lets you instantly use GPT-4o-mini on whatever you copy.



## 🚀 How it works

1. Copy any text (e.g. coding exercise, math problem, question, note).
2. Raycast runs the script automatically or via a hotkey.
3. It sends the clipboard text to **GPT-4o-mini**.
4. The AI's response is copied back to your clipboard, ready to paste anywhere.


## 🧩 Setup

1. Make sure you have **Node.js** installed.
2. Download **Raycast** from raycast.com
3. Create a new Raycast **Script Command** (search for extensions, go to script command and add the directory that contains the sneaky_gpt.sh file
4. Add your own OpenAI key in:
```
const OPENAI = "YOUR_API_KEY_HERE";
```
⚠️ Do not share your OpenAI API Key with anyone, as it could lead to unwanted billing ⚠️

4. Save it and give it a shortcut (e.g. ```Cmd + Shift + A``` or ```Ctrl + Shift + A```


## 🧠 Example

Copy:

```Write a Java program to calculate factorial recursively```

Returns this paste result: 
```
import java.util.Scanner;
public class Factorial {
    public static int factorial(int n) {
        if (n == 0) return 1;
        return n * factorial(n - 1);
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        System.out.println(factorial(n));
    }
}
```


## ⚡️ Why GPT-4o-mini?
It's the fastest and cheapest (by far) OpenAI model

## About the tool


Built for devs who like instant AI help anywhere (definitely not for cheating purposes).


