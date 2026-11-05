# तत्व · Granth — 4 Tab App Skeleton

Created by Faisal Rafi

## Tabs
1. **होम** — Featured granths + topics
2. **ग्रंथ** — Full list of scriptures
3. **टॉपिक** — Topics with sub-topics
4. **प्रोफाइल** — Bookmarks, history, settings

## Navigation (AI ready)
`NavigationService` se control hota hai:

```dart
NavigationService.goToTab(0);           // Home
NavigationService.goToTab(1);           // Granths
NavigationService.goToTab(2);           // Topics
NavigationService.openGranth('gita');   // Open Bhagavad Gita
NavigationService.openTopic('dharma');  // Open Dharma topic
NavigationService.goBack();             // One step back
NavigationService.goHome();             // Clear stack + Home
```

Voice AI ("है ग्रंथ" + ElevenLabs) isi methods ko call karega.

## Run
```bash
cd granth_app
flutter pub get
flutter run
```

## Brand colors used
- Maroon: `#5C1A1B`
- Saffron: `#C47A2C`
- Cream: `#F6F1E7`
- Ink: `#1A120E`
- Gold: `#B0893E`

## Next steps for Voice AI
1. Wake word ("है ग्रंथ") — Porcupine
2. STT — `speech_to_text`
3. Command parser → call `NavigationService` methods
4. Reply via ElevenLabs cloned voice

Sample commands:
- "ये टॉपिक खोलो" → `openTopic(...)`
- "back" / "पीछे" → `goBack()`
- "होम जाओ" → `goHome()`
- "गीता खोलो" → `openGranth('gita')`
