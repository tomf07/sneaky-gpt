#!/usr/bin/env node
// @raycast.schemaVersion 1
// @raycast.title Run Clipboard with AI
// @raycast.mode inline
// @raycast.packageName AI Tools
// @raycast.icon 🤖

// Description:
// Reads whatever text is currently on your clipboard (question, exercise, idea, etc.),
// sends it to GPT-4o-mini, copies the AI’s response back to clipboard,
// and shows a status message inline in Raycast.

const { execSync, spawnSync } = require("child_process");

const OPENAI_KEY = "YOUR_API_KEY_HERE"; // ⚠️ Replace with your actual key

async function runAI() {
  try {
    // 1️⃣ Get text from clipboard
    const input = execSync("pbpaste").toString().trim();
    if (!input) throw new Error("Clipboard is empty!");

    console.log("📋 Copied text detected:\n", input);

    // 2️⃣ Send to GPT-4o-mini
    const response = await fetch("https://api.openai.com/v1/chat/completions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${OPENAI_KEY}`,
      },
      body: JSON.stringify({
        model: "gpt-4o-mini",
        messages: [
          {
            role: "system",
            content:
              "You are a concise, intelligent AI assistant. Always respond directly and clearly, with no markdown, no explanations, and no extra formatting.",
          },
          { role: "user", content: input },
        ],
      }),
    });

    const data = await response.json();
    const output = data.choices?.[0]?.message?.content?.trim();

    if (!output) throw new Error("No response from GPT-4o-mini.");

    // 3️⃣ Copy result to clipboard
    spawnSync("pbcopy", [], { input: output });
    console.log("✅ AI response copied to clipboard!");
  } catch (err) {
    console.error("❌ Error:", err.message);
  }
}

runAI();

