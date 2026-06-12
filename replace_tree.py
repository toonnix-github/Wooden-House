import os

files = [
    r"C:\Users\SDISMAN\.gemini\antigravity\scratch\Wooden-House\story\episode_1_that_wooden_house.md",
    r"C:\Users\SDISMAN\.gemini\antigravity\brain\073d9f25-b163-43e7-ae71-dca94a29764b\book_1_episode_breakdown.md",
    r"C:\Users\SDISMAN\.gemini\antigravity\brain\073d9f25-b163-43e7-ae71-dca94a29764b\series_lore_backstory.md",
    r"C:\Users\SDISMAN\.gemini\antigravity\scratch\Wooden-House\story\episode_1_outline.md",
    r"C:\Users\SDISMAN\.gemini\antigravity\scratch\Wooden-House\story\book_1_outline.md"
]

for file_path in files:
    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
        
        # Replace specific phrases first
        content = content.replace("ใบโพธิ์รูปหัวใจ", "ใบไทร")
        content = content.replace("ใบโพธิ์แห้งกรอบ", "ใบไทรแห้งกรอบ")
        content = content.replace("ใบโพธิ์ใบใหญ่", "ใบไทร")
        content = content.replace("ใบโพธิ์", "ใบไทร")
        content = content.replace("ต้นโพธิ์", "ต้นไทร")
        content = content.replace("ซอยต้นโพธิ์", "ซอยต้นไทร")
        content = content.replace("โพธิ์ใหญ่", "ไทรใหญ่")
        content = content.replace("กิ่งโพธิ์", "กิ่งไทร")
        content = content.replace("เงาโพธิ์", "เงาไทร")
        
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)
print("Replaced all instances.")
