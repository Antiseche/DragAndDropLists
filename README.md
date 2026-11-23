# drag\_and\_drop\_lists\_plus
Two-level drag and drop reorderable lists.

A maintained continuation of [drag_and_drop_lists](https://pub.dev/packages/drag_and_drop_lists)
by Philip Brink, which is no longer updated. It keeps the same API and adds the fixes listed in the
[changelog](CHANGELOG.md). To migrate, rename the dependency and replace
`package:drag_and_drop_lists/` with `package:drag_and_drop_lists_plus/` in your imports.

For a drag without the rows below jumping, set both animation durations to 0:

```dart
DragAndDropLists(
  itemSizeAnimationDurationMilliseconds: 0,
  listSizeAnimationDurationMilliseconds: 0,
  // ...
)
```

## Features
- Reorder elements between multiple lists
- Reorder lists
- Drag and drop new elements from outside of the lists
- Vertical or horizontal layout
- Use with drag handles, long presses, or short presses
- Expandable lists
- Can be used in slivers
- Prevent individual lists/elements from being able to be dragged
- Easy to extend with custom layouts

<p>
<img src="https://raw.githubusercontent.com/philip-brink/DragAndDropLists/master/readme_images/basic.gif" width="180" title="Basic" alt="Basic list">
<img src="https://raw.githubusercontent.com/philip-brink/DragAndDropLists/master/readme_images/expansion_tiles.gif" width="180" title="Expansion Tiles" alt="Drag and drop expansion tiles">
<img src="https://raw.githubusercontent.com/philip-brink/DragAndDropLists/master/readme_images/drag_handle.gif" width="180" title="Drag Handle" alt="Drag and drop using drag handles">
<img src="https://raw.githubusercontent.com/philip-brink/DragAndDropLists/master/readme_images/drag_into_list.gif" width="180" title="Drag Into Lists" alt="Drag and drop new lists and new items">
<img src="https://raw.githubusercontent.com/philip-brink/DragAndDropLists/master/readme_images/horizontal.gif" width="180" title="Horizontal" alt="Drag and drop horizontal lists">
<img src="https://raw.githubusercontent.com/philip-brink/DragAndDropLists/master/readme_images/list_tiles.gif" width="180" title="List Tiles" alt="Drag and drop list tiles">
<img src="https://raw.githubusercontent.com/philip-brink/DragAndDropLists/master/readme_images/slivers.gif" width="180" title="Slivers" alt="Drag and drop lists using slivers">
</p>

## Usage
To use this plugin, add `drag_and_drop_lists_plus` as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)
For example:

```
dependencies:
  drag_and_drop_lists_plus: ^0.5.0
``` 

Now in your Dart code, you can use: `import 'package:drag_and_drop_lists_plus/drag_and_drop_lists.dart';`

To add the lists, add a `DragAndDropLists` widget. Set its children to a list of `DragAndDropList`. Likewise, set the children of `DragAndDropList` to a list of `DragAndDropItem`.
For example:

```
  // Outer list
  List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();

    // Generate a list
    _contents = List.generate(10, (index) {
      return DragAndDropList(
        header: Text('Header $index'),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: Text('$index.1'),
          ),
          DragAndDropItem(
            child: Text('$index.2'),
          ),
          DragAndDropItem(
            child: Text('$index.3'),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Add a DragAndDropLists. The only required parameters are children,
    // onItemReorder, and onListReorder. All other parameters are used for
    // styling the lists and changing its behaviour. See the samples in the
    // example app for many more ways to configure this.
    return DragAndDropLists(
      children: _contents,
      onItemReorder: _onItemReorder,
      onListReorder: _onListReorder,
    );
  }

  _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

```

For further examples, see the example app or [view the example code](https://github.com/philip-brink/DragAndDropLists/tree/master/example/lib) directly.
