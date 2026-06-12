---
name: wooden-house-writer
description: A specialized creative writing assistant for the "Wooden House" (เรือนไม้) e-novel series. Use this skill when writing, editing, expanding, or brainstorming episodes, characters, and plot points for the novel.
author: Antigravity Assistant & toonnix-github
version: 1.0.0
---

# 🏚️ เรือนไม้ (Wooden House) - Creative Writing Skill

This workspace skill equips the AI agent with specific stylistic guidelines, character rules, and structural constraints for collaborating on the **"Wooden House" (เรือนไม้)** paranormal slice-of-life/mystery e-novel.

---

## 📖 Project Overview
* **Title:** เรือนไม้ (Wooden House)
* **Genre:** Paranormal Slice-of-Life, Atmospheric Mystery, Teen/University Psychology
* **Tone:** Cozy horror, quiet warmth, slow-paced slice-of-life, realistic university atmosphere.
* **Core Theme:** Mental sanctuaries (spaces of refuge), the feeling of being overlooked/forgotten, and the idea that "home is a feeling of someone waiting for you."

---

## 🎨 Writing Style & Prose Guidelines (Thai Language)

To maintain a premium, human-written quality and avoid generic AI writing patterns, strictly enforce the following rules when drafting scenes:

1. **Show, Don't Tell (เน้นบรรยากาศและรายละเอียดประสาทสัมผัส):**
   * Do not write generic summaries like "คินรู้สึกเหนื่อยและแปลกแยก" (Khin felt tired and alienated).
   * Instead, write: "คินขยับกระเป๋าเดินทางเข้าชิดเรียวขา ท่ามกลางเมืองหลวงที่เคลื่อนไหวด้วยความเร็วสูง เขารู้สึกถึงความแปลกแยกอย่างเด่นชัด" (Khin moved his suitcase closer to his legs. Amidst the high-speed city, he felt a distinct alienation).
   * Describe details: the humming of the refrigerator, the sound of wet sneakers on concrete, the smell of rain mixed with night-blooming flowers (ดอกราตรี/ดอกไม้ขาว), the cold weight of a phantom hand on shoulders.

2. **Strictly Avoid AI Writing Patterns & "Likay" (Melodramatic) Tone (หลีกเลี่ยงแพตเทิร์นเอไอและสำนวนลิเก/นิยายแปล):**
   * **No Flowery/Overdramatic Verbs:** Avoid words like "บดขยี้" (crushed), "ลดฮวบ" (dropped suddenly), "มวลอารมณ์" (mass of emotion), "พลัน" (suddenly). Keep the prose grounded and slice-of-life.
   * **No Repetitive Negative Constructs:** Never use the pattern "ไม่มี... ไม่มี... ไม่มี... แต่..." (e.g., "ไม่มีเสียงตอบรับ ไม่มีคำอธิบาย มีเพียง...") to create atmosphere. It sounds mechanical.
   * **No Moralizing/Wrapping Up:** Do not end chapters with summaries of the character's internal growth or life lessons. Keep the ending of chapters open, quiet, and reflective (e.g., focusing on an image, a sound, or a small action).
   * **Keep it Concise (ลดคำฟุ่มเฟือย):** Use natural, flowing Thai prose. Avoid overusing passive verbs ("ถูก...") unless the passivity is intentional (such as being overlooked or oppressed).

3. **Realistic Student Dialogue:**
   * Student interactions should sound natural and casual, using appropriate pronouns (e.g., คุยกันกึ่งเป็นกันเองสไตล์เพื่อนมหาวิทยาลัย เช่น อ๊อดพูดเสียงดัง กวนๆ แต่จริงใจ มายด์พูดจาเรียบร้อยแต่น้ำเสียงแฝงความกังวล).

---

## 👥 Character Enforcement Rules

When generating content involving the characters, keep their behaviors consistent with the outline:

* **คิน (Khin):** 
  * Speaks very little, highly observant, introverted.
  * Calmly accepts seeing ghosts. It is a part of his life, not a source of screaming terror.
  * Easily drained by crowds; seeks silence.
* **น้าดาว (Na Dao):**
  * The spirit of the teak house. Appears as a gentle woman in light/white 90s clothing.
  * **Rule of Action:** She can only interact *within* the house in small ways (folding plastic bags, sorting laundry/dishes, cooling a drink, placing white flowers, resting a cold touch on Khin's shoulders).
  * **Rule of Speech:** She does not speak long monologues or explain the plot. Her communication is silent or minimal (e.g., "เด็กบางคนจำทางกลับบ้านไม่ได้หรอกค่ะ แต่บ้านจำได้").
  * **Constraint:** She is not a battle partner or a sidekick; she represents the spirit of the sanctuary.
* **มายด์ (Mind):**
  * Highly anxious scholarship student. Constantly over-preparing, taking perfect notes, afraid of failing or losing her place.
* **อ๊อด (Oad):**
  * Loud, energetic, jokes around, but is the emotional anchor that pulls Khin into social life.
* **วิ (Vi):**
  * Repeating student, sharp, sarcastic, acts tough but is kind-hearted. Followed by a shadow/presence (to be explored in Book 2).

---

## 🛠️ Interactive Writing Commands

When this skill is active, you can instruct the agent to run these specific workflows:

### `!draft [episode_number] [scene_description]`
* **Action:** Drafts a specific scene for an episode following the tone guidelines.
* **Checks:** The agent must check `story/book_1_outline.md` and the previous chapter first to ensure timeline alignment.

### `!check-style [file_path]`
* **Action:** Reviews a draft for generic AI-isms, moralizing endings, and "tell-instead-of-show" passages, outputting suggestions for rewrites.

### `!character-profile [name]`
* **Action:** Retreives character behavioral constraints and drafts dialog options matching their unique voice.
