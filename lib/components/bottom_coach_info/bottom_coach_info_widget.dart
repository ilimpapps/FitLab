import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bottom_coach_info_model.dart';
export 'bottom_coach_info_model.dart';

class BottomCoachInfoWidget extends StatefulWidget {
  const BottomCoachInfoWidget({
    super.key,
    required this.coachRow,
  });

  final UsersRow? coachRow;

  @override
  State<BottomCoachInfoWidget> createState() => _BottomCoachInfoWidgetState();
}

class _BottomCoachInfoWidgetState extends State<BottomCoachInfoWidget> {
  late BottomCoachInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomCoachInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Описание',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'NTSomic',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.1,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white8,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.kclose3,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              'Давайте знакомиться 🤝\nЯ являюсь дипломированным персональным тренером более 5 лет.\nСам в спорте более 10 лет. Долгое время играл в баскетбол, в студенческой лиге России, являюсь Кандидатом в мастера спорта по баскетболу, но из-за полученных травм был вынужден закончить.\nИ именно мои травмы заставили меня изучать строения тела, биомеханику и физиологию человека.\nЯ закончил академию физической культуры и спорта.\nИмею высшее физкультурное образование (бакалавр по направлению Физическая культура и спорт), прошел обучение по нутрициологии, всегда учусь и повышаю свои компетенции.\nДля меня на первом месте всегда здоровье подопечного. Я знаю каково это, когда боль не отпускает и мучает долгое время и поэтому мое основное направление — Оздоровительный фитнес.\nДолгое время я изучал анатомию и за 5 лет я накопил достаточно инструментов и компетенций для построения красивого и самое главное, здорового тела.\nКлассическая фитнес индустрия, к сожалению, не учитывает состояние вашего здоровья и работает по старому принципу «Чем больше вес штанги, тем лучше». И придя на такие тренировки, свои болячки вы только усугубите.\nЕсли вы и правда хотите поправить и здоровье и качество тела — придите ко мне хотя бы один раз и вы уже за одну тренировку узнаете о своём теле гораздо больше🤝',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.37,
                                  ),
                            ),
                          ),
                        ].addToEnd(const SizedBox(height: 128.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
