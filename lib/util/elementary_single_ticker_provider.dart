import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

mixin ElementarySingleTickerProvider<T extends ElementaryWidget,
    M extends ElementaryModel> on WidgetModel<T, M> implements TickerProvider {
  Ticker? _ticker;

  @override
  Ticker createTicker(TickerCallback onTick) {
    assert(() {
      if (_ticker == null) {
        return true;
      }
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary(
            '$runtimeType is a SingleTickerProviderStateMixin but multiple tickers were created.'),
        ErrorDescription(
            'A SingleTickerProviderStateMixin can only be used as a TickerProvider once.'),
        ErrorHint(
          'If a State is used for multiple AnimationController objects, or if it is passed to other '
          'objects and those objects might use it more than one time in total, then instead of '
          'mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.',
        ),
      ]);
    }());
    _ticker = Ticker(onTick,
        debugLabel: kDebugMode ? 'created by ${describeIdentity(this)}' : null);
    _updateTickerModeNotifier();
    _updateTicker(); // Sets _ticker.mute correctly.
    return _ticker!;
  }

  @override
  void dispose() {
    assert(() {
      if (_ticker == null || !_ticker!.isActive) {
        return true;
      }
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('$this was disposed with an active Ticker.'),
        ErrorDescription(
          '$runtimeType created a Ticker via its SingleTickerProviderStateMixin, but at the time '
          'dispose() was called on the mixin, that Ticker was still active. The Ticker must '
          'be disposed before calling super.dispose().',
        ),
        ErrorHint(
          'Tickers used by AnimationControllers '
          'should be disposed by calling dispose() on the AnimationController itself. '
          'Otherwise, the ticker will leak.',
        ),
        _ticker!.describeForError('The offending ticker was'),
      ]);
    }());
    _tickerModeNotifier?.removeListener(_updateTicker);
    _tickerModeNotifier = null;
    super.dispose();
  }

  ValueNotifier<bool>? _tickerModeNotifier;

  @override
  void activate() {
    super.activate();
    // We may have a new TickerMode ancestor.
    _updateTickerModeNotifier();
    _updateTicker();
  }

  void _updateTicker() {
    if (_ticker != null) {
      _ticker!.muted = !_tickerModeNotifier!.value;
    }
  }

  void _updateTickerModeNotifier() {
    final ValueNotifier<bool> newNotifier = TickerMode.getNotifier(context);
    if (newNotifier == _tickerModeNotifier) {
      return;
    }
    _tickerModeNotifier?.removeListener(_updateTicker);
    newNotifier.addListener(_updateTicker);
    _tickerModeNotifier = newNotifier;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    String? tickerDescription;
    if (_ticker != null) {
      if (_ticker!.isActive && _ticker!.muted) {
        tickerDescription = 'active but muted';
      } else if (_ticker!.isActive) {
        tickerDescription = 'active';
      } else if (_ticker!.muted) {
        tickerDescription = 'inactive and muted';
      } else {
        tickerDescription = 'inactive';
      }
    }
    properties.add(DiagnosticsProperty<Ticker>('ticker', _ticker,
        description: tickerDescription, showSeparator: false, defaultValue: null));
  }

  // @override
  // void didUpdateWidget(ElementaryWidget<IWidgetModel> oldWidget) {
  //   didUpdateWidget(oldWidget);
  // }

  // @override
  // void setupTestWidget(ElementaryWidget<IWidgetModel>? testWidget) {
  //   super.setupTestWidget(testWidget);
  // }
}
