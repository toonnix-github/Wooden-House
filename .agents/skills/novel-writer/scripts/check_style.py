import re
import sys
import os

def check_novel_style(file_path):
    if not os.path.exists(file_path):
        print(f"Error: File not found at {file_path}")
        return

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    lines = content.split('\n')
    issues = []

    # Patterns to look for
    pattern_repetitive_neg = re.compile(r'ไม่มี.*ไม่มี.*ไม่มี', re.IGNORECASE)
    pattern_ai_immediate = re.compile(r'(ทันทีทันใด|อย่างรวดเร็ว|โดยอัตโนมัติ|เป็นอย่างยิ่ง|อย่างสิ้นหวัง)', re.IGNORECASE)
    pattern_passive = re.compile(r'ถูก(ทำร้าย|แกล้ง|ขัง|มองข้าม|ทิ้ง|บีบ|ทำลาย)', re.IGNORECASE) # OK, but check for generic overuse
    
    # Track word count and stats
    word_count = len(content.split())
    passive_count = content.count('ถูก')
    
    print(f"=== Style Report for: {os.path.basename(file_path)} ===")
    print(f"Total Words (approx): {word_count}")
    print(f"Passive voice marker ('ถูก') frequency: {passive_count} times\n")

    for idx, line in enumerate(lines, 1):
        line = line.strip()
        if not line:
            continue

        # Check for repetitive negative patterns (AI pattern: "ไม่มี... ไม่มี... มีเพียง...")
        if pattern_repetitive_neg.search(line):
            issues.append((idx, "Repetitive negative pattern ('ไม่มี... ไม่มี...') detected. Try writing more active description."))

        # Check for AI-like adverbs/clichés
        ai_words = pattern_ai_immediate.findall(line)
        if ai_words:
            issues.append((idx, f"AI-like adverbs/clichés detected: {list(set(ai_words))}. Consider simplifying or showing action."))

        # Check paragraph length (long paragraphs are harder to read in e-novels)
        if len(line) > 800:
            issues.append((idx, f"Very long paragraph ({len(line)} chars). Consider breaking it up for pacing."))

        # Check for moralizing final sentences in chapters (AI habit)
        if idx == len(lines) or (idx > len(lines) - 5 and "เรียนรู้" in line and "ชีวิต" in line):
            issues.append((idx, "Possible moralizing or summarizing tone at the end. Keep ending open and sensory."))

    if not issues:
        print("✓ No obvious style issues detected! The draft fits the guidelines well.")
    else:
        print("⚠️ Potential style warnings:")
        for line_num, msg in issues[:20]: # limit to top 20
            print(f"  Line {line_num}: {msg}")
            # print snippet
            snippet = lines[line_num - 1][:60]
            print(f"    Snippet: \"{snippet}...\"")
        
        if len(issues) > 20:
            print(f"  ...and {len(issues) - 20} more style suggestions.")

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python check_style.py <path_to_draft.md>")
    else:
        check_novel_style(sys.argv[1])
