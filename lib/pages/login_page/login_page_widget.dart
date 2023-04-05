import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (functions.isValidPhone(_model.textController1.text)) {
        _model.isValidPhone = true;
      } else {
        _model.isValidPhone = false;
      }

      setState(() {
        _model.isPasswordEmpty = false;
      });
      setState(() {
        _model.onloadPassword = true;
      });
    });

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController1?.text = '+7';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 90.0, 0.0, 54.0),
                          child: Text(
                            'Приветствуем в ariba 👋🏻',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).textBlack,
                                  fontSize: 40.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 32.0),
                          child: Text(
                            'Войдите в свой аккаунт по номеру телефона',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).defaultColor,
                                  fontSize: 14.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                  lineHeight: 1.5,
                                ),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          height: _model.isValidPhone ? 292.0 : 165.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController1',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          if (functions.isValidPhone(
                                              _model.textController1.text)) {
                                            setState(() {
                                              _model.isValidPhone = true;
                                            });
                                          } else {
                                            setState(() {
                                              _model.isValidPhone = false;
                                            });
                                          }
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Номер телефона',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: valueOrDefault<Color>(
                                              _model.isValidPhone
                                                  ? FlutterFlowTheme.of(context)
                                                      .green
                                                  : FlutterFlowTheme.of(context)
                                                      .defaultColor,
                                              FlutterFlowTheme.of(context)
                                                  .defaultColor,
                                            ),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .textBlack,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24.0, 18.0, 24.0, 18.0),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        color: valueOrDefault<Color>(
                                          _model.isValidPhone
                                              ? FlutterFlowTheme.of(context)
                                                  .green
                                              : FlutterFlowTheme.of(context)
                                                  .textBlack,
                                          FlutterFlowTheme.of(context)
                                              .textBlack,
                                        ),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                        height: 1.6,
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                      inputFormatters: [_model.textFieldMask1],
                                    ),
                                  ),
                                  if (_model.isValidPhone == true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: TextFormField(
                                          controller: _model.textController2,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController2',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              if (functions.isValidPassword(
                                                  _model
                                                      .textController2.text)) {
                                                setState(() {
                                                  _model.isPasswordEmpty =
                                                      false;
                                                });
                                              } else {
                                                setState(() {
                                                  _model.isPasswordEmpty = true;
                                                });
                                              }

                                              setState(() {
                                                _model.onloadPassword = false;
                                              });
                                            },
                                          ),
                                          obscureText:
                                              !_model.passwordVisibility,
                                          decoration: InputDecoration(
                                            hintText: 'Пароль',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if (_model.onloadPassword) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .defaultColor;
                                                    } else if (_model
                                                        .isPasswordEmpty) {
                                                      return Color(0xFFFF4D4F);
                                                    } else if (_model
                                                        .isValidPhone) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .green;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .defaultColor;
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .defaultColor,
                                                ),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 18.0, 24.0, 18.0),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => _model
                                                        .passwordVisibility =
                                                    !_model.passwordVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            color: valueOrDefault<Color>(
                                              _model.isValidPhone
                                                  ? FlutterFlowTheme.of(context)
                                                      .green
                                                  : FlutterFlowTheme.of(context)
                                                      .textBlack,
                                              FlutterFlowTheme.of(context)
                                                  .textBlack,
                                            ),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            height: 1.66,
                                          ),
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (valueOrDefault<bool>(
                                          _model.isPasswordEmpty == true,
                                          true,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 14.0, 0.0),
                                            child: Icon(
                                              Icons.settings_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .errorOrAlert,
                                              size: 18.0,
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          _model.isPasswordEmpty == true,
                                          true,
                                        ))
                                          Text(
                                            'Заполните поля',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFFF4D4F),
                                                  fontSize: 12.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (functions.isValidPassword(
                                          _model.textController2.text)) {
                                        setState(() {
                                          _model.isPasswordEmpty = false;
                                        });
                                      } else {
                                        setState(() {
                                          _model.isPasswordEmpty = true;
                                        });
                                      }
                                    },
                                    text: 'Войти',
                                    options: FFButtonOptions(
                                      width: 1000.0,
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        functions.changeButtonColor(
                                            _model.textController1.text,
                                            FlutterFlowTheme.of(context).green,
                                            FlutterFlowTheme.of(context)
                                                .defaultColor),
                                        FlutterFlowTheme.of(context)
                                            .defaultColor,
                                      ),
                                      textStyle: GoogleFonts.getFont(
                                        'Poppins',
                                        fontSize: 20.0,
                                        height: 1.8,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (valueOrDefault<bool>(
                                          _model.isValidPhone == true,
                                          true,
                                        ))
                                          FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Забыли пароль?',
                                            options: FFButtonOptions(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: GoogleFonts.getFont(
                                                'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textBlack,
                                                fontSize: 12.0,
                                              ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                          _model.isValidPhone == true,
                                          true,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: 'Восстановить пароль',
                                              options: FFButtonOptions(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFF1F4F8),
                                                textStyle: GoogleFonts.getFont(
                                                  'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .green,
                                                  fontSize: 12.0,
                                                ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
