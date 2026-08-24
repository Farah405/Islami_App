import 'package:flutter/material.dart';
import 'package:islami_app/models/suras_list.dart';
import 'package:islami_app/theme/AppAssets.dart';
import 'package:islami_app/theme/App_Colors.dart';
import 'package:islami_app/Services/api_service.dart';
import 'package:islami_app/modules/layout/QuranLayout/Widgets/Qurandetails.dart';

class QuranLayout extends StatefulWidget {
  const QuranLayout({super.key});

  @override
  State<QuranLayout> createState() => _QuranLayoutState();
}

class _QuranLayoutState extends State<QuranLayout> {
  List<SuraModel> allSuras = [];
  List<SuraModel> filteredSuras = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadSuras();
  }
  Future<void> _loadSuras() async {
    try {
      final suras = await ApiService().fetchSuras();
      setState(() {
        allSuras = suras;
        filteredSuras = suras;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }
  void _filterSuras(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuras = allSuras;
      } else {
        filteredSuras = allSuras.where((sura) {
          final nameAr = sura.name.toLowerCase();
          final nameEn = sura.englishName.toLowerCase();
          final input = query.toLowerCase();
          return nameAr.contains(input) || nameEn.contains(input);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.quranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Image.asset(AppImages.upperLogo)),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                onChanged: _filterSuras,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.white, width: 2),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset('assets/icons/quran-svgrepo-com 1.png'),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Most Recently",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: isLoading || allSuras.length < 3 ? 0 : 3,
                itemBuilder: (context, index) {
                  final sura = allSuras[index];
                  return Container(
                    width: 220,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sura.englishName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                sura.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${sura.versCount} Verses",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          AppImages.Image1,
                          width: 90,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Suras List",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            _buildSurasList(),
          ],
        ),
      ),
    );
  }
  Widget _buildSurasList() {
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'حدث خطأ أثناء تحميل البيانات',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      );
    }

    if (filteredSuras.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'لا توجد نتائج بحث',
            style: TextStyle(color: AppColors.white, fontSize: 16),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredSuras.length,
      itemBuilder: (context, index) {
        final sura = filteredSuras[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Qurandetails(
                  suraId: sura.id,
                  suraName: sura.name,
                  englishName: sura.englishName,
                ),
              ),
            );
          },
          child: SizedBox(
            height: 62,
            child: Row(
              children: [
              SizedBox(
                width: 44,
                height: 44,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppIcons.SuraIcon,
                      width: 44,
                      height: 44,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "${sura.id}",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sura.englishName,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${sura.versCount} Verses",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    sura.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) =>
          Divider(color: AppColors.white, thickness: 1),
    );
  }
}