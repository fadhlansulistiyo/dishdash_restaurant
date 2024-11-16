// Mocks generated by Mockito 5.4.4 from annotations
// in dishdash_restaurant/test/providers/restaurant_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dishdash_restaurant/data/api/api_service.dart' as _i5;
import 'package:dishdash_restaurant/data/model/restaurant_detail.dart' as _i3;
import 'package:dishdash_restaurant/data/model/restaurant_result.dart' as _i2;
import 'package:dishdash_restaurant/data/model/restaurant_review.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRestaurantResult_0 extends _i1.SmartFake
    implements _i2.RestaurantResult {
  _FakeRestaurantResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRestaurantDetailResult_1 extends _i1.SmartFake
    implements _i3.RestaurantDetailResult {
  _FakeRestaurantDetailResult_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReview_2 extends _i1.SmartFake implements _i4.Review {
  _FakeReview_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i5.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.RestaurantResult> getListRestaurant() => (super.noSuchMethod(
        Invocation.method(
          #getListRestaurant,
          [],
        ),
        returnValue:
            _i6.Future<_i2.RestaurantResult>.value(_FakeRestaurantResult_0(
          this,
          Invocation.method(
            #getListRestaurant,
            [],
          ),
        )),
      ) as _i6.Future<_i2.RestaurantResult>);

  @override
  _i6.Future<_i2.RestaurantResult> searchRestaurant(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchRestaurant,
          [query],
        ),
        returnValue:
            _i6.Future<_i2.RestaurantResult>.value(_FakeRestaurantResult_0(
          this,
          Invocation.method(
            #searchRestaurant,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.RestaurantResult>);

  @override
  _i6.Future<_i3.RestaurantDetailResult> getRestaurantDetail(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurantDetail,
          [id],
        ),
        returnValue: _i6.Future<_i3.RestaurantDetailResult>.value(
            _FakeRestaurantDetailResult_1(
          this,
          Invocation.method(
            #getRestaurantDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.RestaurantDetailResult>);

  @override
  _i6.Future<_i4.Review> addReview(
    String? id,
    String? name,
    String? review,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addReview,
          [
            id,
            name,
            review,
          ],
        ),
        returnValue: _i6.Future<_i4.Review>.value(_FakeReview_2(
          this,
          Invocation.method(
            #addReview,
            [
              id,
              name,
              review,
            ],
          ),
        )),
      ) as _i6.Future<_i4.Review>);
}