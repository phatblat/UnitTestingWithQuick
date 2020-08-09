# Unit Testing with Quick (and Nimble)

- Presented at [360|iDev 2020](https://360idev.com/sessions/unit-testing-with-quick-and-nimble/)
on Monday 2020-08-17
- Presented at Mobile Developer Community of Practice,
an internal virtual gathering at Kaiser Permanente, on 2020-05
- Presented at [Cocoaheads Denver](https://www.meetup.com/CocoaheadsDenver/)
on Tuesday 2020-03-10 at Galvanize (Platte)

## 🗞 Contents

- [Example Xcode Project](Example/)
- Presentation Slides (PDF)
- [Presentation Source (Markdown)](presentation.md)
  - Presented using [Deckset](https://www.deckset.com/)

## ⚒️ Example

The Xcode project containing example tests lives in the `Example/` folder.
Note that the `Pods/` folder is ignored and will initially be missing following
a fresh clone. Run the following commands from the root of this repo to download
dependencies and generate the required Pods project:

```bash
bundle install
cd Example/
bundle exec pod install
open *.xcworkspace
```

## 📄 License

This repo is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for rights and limitations.
