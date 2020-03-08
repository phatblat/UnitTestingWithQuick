# Unit Testing with Quick

Presented at [Cocoaheads Denver](https://www.meetup.com/CocoaheadsDenver/)
on Tuesday 2020-03-10 at Galvanize (Platte)

## 🗞 Contents

- [Example Xcode Project](Example/)
- Presentation Slides (PDF)
- [Presentation Source (Markdown)](presentation.md)
  - Presented using [Deckset](https://www.deckset.com/)

## ⚒️ Example

> I used Xcode 11.4 beta 3 to create this project. It doesn't use any new features
> that I'm aware of, but I haven't tested it in the current Xcode 11.3.1.

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
