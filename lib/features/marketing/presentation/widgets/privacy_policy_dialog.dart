import 'package:flutter/material.dart';

import '../marketing_tokens.dart';

void showPrivacyPolicyDialog(BuildContext context) {
  final policy = _PrivacyPolicyCopy.forLocale(Localizations.localeOf(context));

  showDialog<void>(
    context: context,
    builder: (context) {
      final screenSize = MediaQuery.sizeOf(context);
      final maxHeight = screenSize.height * 0.78;

      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 760, maxHeight: maxHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 16, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            policy.title,
                            style: const TextStyle(
                              color: LandingColors.ink,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            policy.updated,
                            style: const TextStyle(
                              color: LandingColors.muted,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: policy.closeLabel,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: LandingColors.line),
              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 26),
                    child: SelectableText.rich(
                      TextSpan(children: _policySpans(policy.body)),
                      style: const TextStyle(
                        color: LandingColors.muted,
                        fontSize: 14,
                        height: 1.55,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

String privacyPolicyLinkLabel(BuildContext context) {
  return _PrivacyPolicyCopy.forLocale(
    Localizations.localeOf(context),
  ).linkLabel;
}

List<InlineSpan> _policySpans(String body) {
  final spans = <InlineSpan>[];
  final blocks = body.trim().split('\n\n');

  for (var index = 0; index < blocks.length; index += 1) {
    final block = blocks[index].trim();
    final lines = block.split('\n');
    final heading = lines.first.trim();
    final hasHeading = heading.length < 80 && lines.length > 1;
    final rest = lines.skip(1).join('\n');

    if (hasHeading) {
      spans.add(
        TextSpan(
          text: heading,
          style: const TextStyle(
            color: LandingColors.ink,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            height: 1.45,
          ),
        ),
      );
      spans.add(TextSpan(text: '\n$rest'));
    } else {
      spans.add(
        TextSpan(
          text: block,
          style: block.length < 80
              ? const TextStyle(
                  color: LandingColors.ink,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  height: 1.45,
                )
              : null,
        ),
      );
    }

    if (index != blocks.length - 1) {
      spans.add(const TextSpan(text: '\n\n'));
    }
  }

  return spans;
}

class _PrivacyPolicyCopy {
  const _PrivacyPolicyCopy({
    required this.title,
    required this.updated,
    required this.closeLabel,
    required this.linkLabel,
    required this.body,
  });

  final String title;
  final String updated;
  final String closeLabel;
  final String linkLabel;
  final String body;

  static _PrivacyPolicyCopy forLocale(Locale locale) {
    return switch (locale.languageCode) {
      'fi' => _fi,
      'sv' => _sv,
      _ => _en,
    };
  }
}

const _en = _PrivacyPolicyCopy(
  title: 'Privacy Policy',
  updated: 'Last updated: 15 September 2026',
  closeLabel: 'Close',
  linkLabel: 'Privacy Policy',
  body: '''
PRIVACY POLICY

Last updated: 15 September 2026

This Privacy Policy explains how FRSH Nearby Ab ("FRSH Nearby", "FRSH", "we", "us" or "our") collects, uses, stores, shares and otherwise processes personal data in connection with the FRSH Nearby website, mobile application, digital marketplace and related services (collectively, the "Service").
This Privacy Policy applies to consumers, business customers, producers, business producers, persons joining a waiting list, website visitors and other individuals whose personal data is processed in connection with the Service.
FRSH Nearby processes personal data in accordance with the General Data Protection Regulation (EU) 2016/679 ("GDPR"), the Finnish Data Protection Act (1050/2018), and other applicable data protection and electronic communications legislation.

1.	Data Controller and Contact Details
The data controller responsible for the processing described in this Privacy Policy is:
FRSH Nearby Ab
Business ID: 3640701-3
Registered address: Hovrättsesplanaden 23 A 20, 65100 Vaasa, Finland
Email for privacy matters: info@frshnearby.com
Questions concerning this Privacy Policy, the processing of personal data or the exercise of data protection rights may be directed to the email address above.

2.	Roles of FRSH Nearby, Buyers and Producers
FRSH Nearby operates a digital marketplace through which Buyers and Producers may discover products, communicate and enter into transactions.
FRSH Nearby acts as a data controller for personal data processed for operating the platform, administering accounts, facilitating orders and payments, providing customer support, maintaining security, preventing fraud, analysing and developing the Service, and carrying out the other processing described in this Privacy Policy.
When a Buyer places an order with a Producer, certain personal data may be disclosed to that Producer where necessary to fulfil the order, arrange pickup or delivery, communicate with the Buyer, comply with food safety or product traceability, handle complaints or recalls, or comply with accounting or other legal requirements.
A Producer may, in such circumstances, process certain personal data as an independent data controller for its own purposes and legal obligations. Such processing is governed by the Producer's own responsibilities under applicable data protection legislation.
FRSH Nearby is not responsible for processing independently carried out by Producers outside the FRSH Nearby Service.

3.	Purposes and Legal Bases for Processing
FRSH Nearby processes personal data only where there is an appropriate legal basis for doing so.
Creating, maintaining and authenticating user accounts (Performance of a contract, Article 6(1)(b) GDPR), 
Providing the marketplace and its features  (Performance of a contract, Article 6(1)(b))
Processing and facilitating orders (Performance of a contract, Article 6(1)(b)) 
facilitating payments, refunds and Producer payouts (Performance of a contract and, where applicable, legal obligations, Articles 6(1)(b) and 6(1)(c)) 
Maintaining accounting, taxation and transaction records (Compliance with legal obligations, Article 6(1)(c) 
Customer support and dispute handling  (Performance of a contract and legitimate interests, Articles 6(1)(b) and 6(1)(f)) 
Fraud prevention, abuse prevention and platform security (Legitimate interests and, where applicable, legal obligations, Articles 6(1)(f) and 6(1)(c)) 
Verifying Producers, businesses and account information (Performance of a contract, legitimate interests and legal obligations, as applicable)
Providing location-based functionality using precise device location  (Consent, Article 6(1)(a), where consent is required) 
Using an address, municipality or voluntarily declared location to provide marketplace functionality (Performance of a contract and/or legitimate interests, depending on the processing
Sending order confirmations, security alerts and other necessary service communications (Performance of a contract and legitimate interests) 
Waiting-list administration and launch communications (Consent and/or steps taken at the user's request before entering into a contract) 
Newsletters and electronic direct marketing (Consent where required by applicable law)
Internal analytics and Service development (Legitimate interests where permitted; consent where consent is legally required for the technology used) 
Personalised product or Producer recommendations (Legitimate interests and, where required, consent) 
Establishing, exercising or defending legal claims (Legitimate interests and compliance with legal obligations) 
Responding to lawful requests from authorities  (Compliance with legal obligations) 
Corporate transactions, restructuring, financing or due diligence  (Legitimate interests, subject to appropriate safeguards) 
Where FRSH Nearby relies on legitimate interests, we assess whether the processing is necessary and proportionate and whether our interests are overridden by the interests, fundamental rights or freedoms of the data subject.

4.	Categories of Personal Data Processed
Depending on how an individual uses the Service, FRSH Nearby may process identification and account information such as name, username, email address, telephone number, account type, profile information and internal user identifiers.
We may process authentication information such as authentication identifiers, login records, security information and authentication tokens. Authentication credentials may also be processed directly by third-party authentication providers. FRSH Nearby does not intend to store passwords in plaintext.
We may process address and location information, including billing address, delivery address, pickup location, municipality, voluntarily declared location, approximate location and, where permission has been granted, precise GPS or device location.
Transaction information may include orders, purchased products, quantities, prices, discounts, timestamps, payment status, refund information, delivery or pickup information, transaction identifiers and order history.
Payment-related information may include information necessary for facilitating payment transactions and payouts. Full payment card numbers, card security codes and similar payment credentials are generally processed directly by authorised payment service providers rather than stored by FRSH Nearby.
For Producers and business users, we may additionally process business name, Business ID, VAT information, business contact details, bank or payout information where required, verification information, product listings, collection or delivery locations and information relating to Producer activity on the marketplace.
We may process communications between users and FRSH Nearby, customer support requests, complaint information, dispute information, ratings, reviews and other content voluntarily submitted through the Service.
Technical information may include IP address, device type, device identifiers, operating system, browser type, application version, language settings, authentication events, crash information, log information, session information and other information necessary for securing and operating the Service.
Usage information may include searches, product views, Producer views, interactions with marketplace features, navigation within the Service, order activity and similar information concerning use of the Service.
Where push notifications are enabled, we may process a device or push-notification token and information necessary for delivering notifications.

5.	Precise Location Data
Certain FRSH Nearby features may use the location of the user's device to display nearby Producers, products, pickup locations, delivery options or other geographically relevant content.
Where precise device location requires consent or device permission, FRSH Nearby will request such permission before accessing the information.
Users may normally withdraw access to precise location through the operating system or device settings. Certain location-based functionality may become unavailable or less accurate where location access is disabled.
Where possible, users may be offered alternatives such as manually entering an address, municipality or other location instead of sharing continuous or precise GPS information.
FRSH Nearby does not intend to continuously track users' precise location when the relevant functionality does not require it.

6.	Information Obtained from Third Parties
FRSH Nearby primarily obtains personal data directly from users.
Personal data may also be obtained from payment service providers, authentication providers, delivery or logistics partners where applicable, Producers or Buyers involved in a transaction, public business registers, public authorities, fraud-prevention or security providers and other service providers where obtaining such information is necessary and lawful.
Where a user chooses to sign in through a third-party authentication service, FRSH Nearby may receive information such as the user's name, email address, account identifier or other information authorized by the user through that service.

7.	Public Information and Producer Profiles
Certain information voluntarily provided by Producers is intended to be displayed publicly or to other users of the Service.
This may include a Producer's business or trading name, profile image, description, general location, products, prices, delivery or pickup information, ratings and other marketplace information.
Users should not include unnecessary personal, confidential or sensitive information in public profiles, product descriptions, reviews or other publicly visible content.

8.	Special Categories of Personal Data
FRSH Nearby does not generally require users to provide special categories of personal data within the meaning of Article 9 GDPR, such as information concerning health, religion, political opinions, biometric identification or sexual orientation.
Users are requested not to provide such information through free-text fields, customer support communications, reviews or other content unless it is genuinely necessary.
If FRSH Nearby exceptionally needs to process special-category personal data, such processing will take place only where an appropriate legal basis under applicable data protection legislation exists.

9.	Recipients and Disclosure of Personal Data
Personal data may be disclosed or made available where necessary to Buyers and Producers involved in a transaction; payment and payout service providers; authentication and identity service providers; cloud infrastructure and hosting providers; database and information-system providers; email, communication and notification providers; mapping and location-service providers; analytics and service-monitoring providers; fraud-prevention and cybersecurity providers; customer-support providers; professional advisers such as accountants, auditors and legal advisers; and other technical subcontractors necessary for providing the Service.
FRSH Nearby may disclose personal data to courts, law-enforcement authorities, supervisory authorities, tax authorities and other public authorities where required or permitted by applicable law.
Personal data may also be disclosed in connection with a merger, acquisition, financing transaction, sale of assets, restructuring or similar corporate transaction, subject to appropriate confidentiality and data protection safeguards.
FRSH Nearby does not sell personal data to third parties.
Where third parties process personal data solely on behalf of FRSH Nearby, FRSH Nearby seeks to use appropriate contractual arrangements as required by Article 28 GDPR.
Certain third parties, including payment providers, application-store operators, Producers or other parties, may instead process personal data as independent data controllers for their own purposes. Their processing is governed by their respective privacy notices and applicable law.

10.	Payment Services
Payments, refunds and Producer payouts may be processed by third-party payment service providers.
Such providers may process identification, transaction, payment method, bank, fraud-prevention and other information necessary to execute payments and comply with financial regulation.
Payment service providers may act as independent data controllers for certain processing required by payment-services, anti-fraud, anti-money-laundering, accounting or other applicable legislation.
FRSH Nearby generally does not receive or store complete card details where those details are submitted directly to the payment service provider.

11.	Cookies, SDKs and Similar Technologies
The FRSH Nearby website and application may use cookies, local storage, software development kits ("SDKs"), device identifiers and similar technologies.
Some technologies are necessary for authentication, security, remembering user choices, maintaining sessions and providing essential functionality.
Where required by applicable law, analytics, advertising, measurement or other non-essential technologies will not be activated until the user has provided the necessary consent.
Where consent is used, users will be provided with a mechanism for managing or withdrawing their choices.
Further information about technologies used on the FRSH Nearby website may be provided in a separate Cookie Policy or cookie-preference interface.

12.	Analytics and Service Development
FRSH Nearby may analyze information concerning how the Service is used in order to identify technical problems, understand the performance of features, improve usability, develop new functionality, measure marketplace activity and maintain the reliability and security of the Service.
Where reasonably possible, FRSH Nearby may use aggregated, pseudonymised or anonymised information for analytics and development.
Information that has been irreversibly anonymised so that an individual can no longer be identified is not personal data under the GDPR.

13.	Marketing and Communications
FRSH Nearby may send communications necessary for operating the Service, including order confirmations, changes to orders, payment information, account notices, security messages, customer-support responses and important changes to the Service.
Such necessary service communications are not treated as optional marketing communications.
FRSH Nearby may separately send newsletters, promotional messages and other direct marketing where permitted by applicable law.
Where marketing is based on consent, the recipient may withdraw that consent at any time. Unsubscribing from marketing does not prevent FRSH Nearby from sending communications necessary for an existing account, order, transaction or legal obligation.

14.	Automated Decision-Making and Profiling
FRSH Nearby may use automated processing to personalise content, rank or recommend Producers and products, identify potentially fraudulent or unusual activity, improve marketplace functionality and analyse the use of the Service.
Recommendations may take into account information such as location, searches, viewed products, previous orders, availability, delivery dates or interactions with the Service.
FRSH Nearby does not intend to make decisions based solely on automated processing that produce legal effects concerning a user or similarly significantly affect that user within the meaning of Article 22 GDPR.
If FRSH Nearby introduces such automated decision-making in the future, users will receive the additional information and safeguards required by applicable law.

15.	Transfers Outside the EU and EEA
Some service providers used by FRSH Nearby may process personal data outside the European Union or European Economic Area.
Where personal data is transferred outside the EEA, FRSH Nearby takes steps to ensure that the transfer is made using a lawful transfer mechanism and that an appropriate level of protection is maintained.
Depending on the circumstances, such mechanisms may include an adequacy decision adopted by the European Commission, the European Commission's Standard Contractual Clauses, or another transfer mechanism permitted under Chapter V GDPR.
Where required, supplementary technical, contractual or organizational safeguards may also be implemented.
Information concerning applicable transfer safeguards may be requested using the privacy contact details stated in this Privacy Policy.
FRSH Nearby stores its data in Europe in accordance with relevant regulations.

16.	Retention of Personal Data
FRSH Nearby retains personal data only for as long as necessary for the purposes for which the information was collected and thereafter only where retention is required or justified by applicable law.
Account information is generally retained while an account remains active and for an appropriate period following account closure where necessary to handle outstanding transactions, disputes, fraud prevention, legal claims or statutory obligations.
Order, transaction, payment and accounting information may be retained for the periods required under applicable accounting, taxation and other legislation.
Customer-support communications may be retained for an appropriate period after the relevant matter has been resolved where necessary to document the handling of the matter or establish, exercise or defend legal claims.
Security and technical logs are retained only for periods reasonably necessary for security, troubleshooting, fraud prevention and system administration.
Waiting-list and consent-based marketing information will be deleted or suppressed when consent is withdrawn or when the information is no longer required for the relevant purpose, subject to limited information that may be retained to document the withdrawal or prevent further marketing.
Backup copies may remain temporarily after deletion until they are overwritten according to FRSH Nearby's backup and disaster-recovery procedures.
FRSH Nearby periodically reviews whether personal data continues to be necessary.

17.	 Account Closure and Deletion
Users may request closure of their FRSH Nearby account through an account-deletion functionality made available in the Service, where available, or by contacting FRSH Nearby.
Closing or deleting an account does not necessarily result in the immediate deletion of all information associated with the account.
FRSH Nearby may continue to retain information where necessary to comply with statutory accounting or tax requirements, complete outstanding transactions, handle disputes, prevent fraud, enforce agreements, protect legal rights or comply with other applicable legal obligations.
Information that no longer needs to be retained will be deleted or anonymised in accordance with FRSH Nearby's retention practices.

18.	Rights of the Data Subject
Subject to the requirements and limitations of applicable law, a data subject may have the right to access personal data concerning them; request correction of inaccurate or incomplete personal data; request erasure of personal data; request restriction of processing; object to processing based on legitimate interests; object at any time to the processing of personal data for direct marketing; receive eligible personal data in a structured, commonly used and machine-readable format and transmit it to another controller; withdraw consent where processing is based on consent; and exercise rights relating to qualifying automated decision-making.
The exercise of a right may depend on the circumstances and legal basis for the processing. For example, the right to erasure does not require FRSH Nearby to delete information that must be retained pursuant to a legal obligation.
FRSH Nearby may request information reasonably necessary to verify the identity of the person making a data protection request.
Requests may be submitted using the contact information stated in Section 1.

19.	Withdrawal of Consent
Where processing is based on consent, the data subject may withdraw that consent at any time.
Depending on the relevant processing, consent may be withdrawn through account settings, device permissions, cookie settings, an unsubscribe function or by contacting FRSH Nearby.
Withdrawal of consent does not affect the lawfulness of processing carried out before consent was withdrawn.
Where particular optional functionality depends on the relevant consent, that functionality may become unavailable after consent is withdrawn.

20.	Right to Lodge a Complaint
A data subject who believes that FRSH Nearby has processed personal data in breach of applicable data protection legislation has the right to lodge a complaint with a competent data protection supervisory authority.
For FRSH Nearby's activities in Finland, the relevant supervisory authority is the Office of the Data Protection Ombudsman of Finland.
Depending on the circumstances, a data subject may also have the right to lodge a complaint with the supervisory authority of another EU or EEA Member State, including in the Member State of their habitual residence, place of work or the place of an alleged infringement.
We encourage users to contact FRSH Nearby first where appropriate so that we have an opportunity to investigate and address the concern.

21.	Obligation to Provide Personal Data
Certain personal data is necessary for FRSH Nearby to create an account, provide the Service, facilitate transactions or comply with legal obligations.
Required information may include, depending on the Service used, identification and contact information, account information, order information, delivery or pickup information, and information required for payment processing or Producer verification.
If information necessary for providing a service is not provided, FRSH Nearby may be unable to create an account, provide certain functionality, process an order, facilitate a payment or otherwise provide the requested service.
Optional information is identified as such where appropriate, and users may choose not to provide it.

22.	Children and Minors
Eligibility to create an account and enter into transactions through FRSH Nearby is governed by the FRSH Nearby Terms of Service and applicable law.
FRSH Nearby does not knowingly seek to collect personal data from children in circumstances where such processing would not be lawful.
Where processing of a minor's personal data requires the consent or authorisation of a parent or legal guardian under applicable law, FRSH Nearby may take reasonable measures to obtain or verify such authorization.
If FRSH Nearby becomes aware that personal data relating to a child has been collected unlawfully, appropriate steps will be taken to delete or otherwise lawfully handle the information.

23.	Protection of Personal Data
FRSH Nearby implements technical and organisational measures intended to protect personal data against unauthorised access, disclosure, alteration, loss, destruction and other unlawful processing.
Measures may include encryption in transit, access controls, authentication mechanisms, role-based permissions, secure credential handling, logging, backups, software updates, monitoring, development practices and restrictions on employee and contractor access to personal data.
Access to personal data is intended to be limited to persons who require such access for their duties.
No online service or method of electronic storage can guarantee absolute security. FRSH Nearby therefore continuously evaluates and develops its security practices according to the nature of the Service and the risks associated with the processing.

24.	Personal Data Breaches
FRSH Nearby maintains procedures for identifying, assessing and responding to suspected personal data breaches.
Where a personal data breach is subject to a notification obligation under applicable data protection legislation, FRSH Nearby will notify the competent supervisory authority and, where legally required, affected data subjects.

25.	Third-Party Services and External Links
The Service may contain links to websites, mapping services, payment services, application stores, authentication services or other services operated by third parties.
Where an individual accesses a third-party service, that third party may process personal data under its own terms and privacy notice.
FRSH Nearby's Privacy Policy does not govern processing independently carried out by such third parties.

26.	Changes to the Purposes of Processing
Where FRSH Nearby intends to process personal data for a purpose materially different from the purpose for which the information was originally collected, FRSH Nearby will assess whether the new processing is lawful and, where required, provide additional information to affected data subjects before commencing the new processing.
Where the new processing requires consent, FRSH Nearby will obtain such consent before carrying out the processing.

27.	Amendments to this Privacy Policy
FRSH Nearby may amend this Privacy Policy to reflect changes to the Service, processing activities, service providers, technology, legislation, regulatory guidance or business operations.
The current version of the Privacy Policy will be made available through the FRSH Nearby website and/or application.
Where changes materially affect how personal data is processed or the rights of users, FRSH Nearby will provide appropriate notice before the changes take effect where required by applicable law.
The date at the beginning of this Privacy Policy indicates when the Policy was most recently updated.

28.	Contact
Questions, requests and concerns relating to privacy or the processing of personal data may be directed to:

FRSH Nearby Ab
Email: info@frshnearby.com
Postal address: Hovrättsesplanaden 23 A 20, 65100 Vaasa, Finland.
''',
);

const _fi = _PrivacyPolicyCopy(
  title: 'Tietosuojaseloste',
  updated: 'Viimeksi päivitetty: 15.9.2026',
  closeLabel: 'Sulje',
  linkLabel: 'tietosuojaselosteen',
  body: '''
TIETOSUOJASELOSTE
Viimeksi päivitetty: 15. syyskuuta 2026
Tässä tietosuojaselosteessa kuvataan, miten FRSH Nearby Ab ("FRSH Nearby", "FRSH", "me", "meitä" tai "meidän") kerää, käyttää, säilyttää, luovuttaa ja muutoin käsittelee henkilötietoja FRSH Nearbyn verkkosivuston, mobiilisovelluksen, digitaalisen markkinapaikan ja niihin liittyvien palvelujen yhteydessä (jäljempänä yhdessä "Palvelu").
Tätä tietosuojaselostetta sovelletaan kuluttajiin, yritysasiakkaisiin, tuottajiin, yritysmuotoisiin tuottajiin, odotuslistalle liittyviin henkilöihin, verkkosivuston kävijöihin sekä muihin henkilöihin, joiden henkilötietoja käsitellään Palvelun yhteydessä.
FRSH Nearby käsittelee henkilötietoja yleisen tietosuoja-asetuksen (EU) 2016/679 ("GDPR"), Suomen tietosuojalain (1050/2018) sekä muun sovellettavan tietosuoja- ja sähköistä viestintää koskevan lainsäädännön mukaisesti.

1. Rekisterinpitäjä ja yhteystiedot
Tässä tietosuojaselosteessa kuvatusta henkilötietojen käsittelystä vastaava rekisterinpitäjä on:
FRSH Nearby Ab
Y-tunnus: 3640701-3
Rekisteröity osoite: Hovrättsesplanaden 23 A 20, 65100 Vaasa, Suomi
Tietosuoja-asioiden sähköpostiosoite: info@frshnearby.com
Tätä tietosuojaselostetta, henkilötietojen käsittelyä tai rekisteröidyn tietosuojaoikeuksien käyttämistä koskevat kysymykset voi lähettää yllä mainittuun sähköpostiosoitteeseen.

2. FRSH Nearbyn, Ostajien ja Tuottajien roolit
FRSH Nearby ylläpitää digitaalista markkinapaikkaa, jonka kautta Ostajat ja Tuottajat voivat löytää tuotteita, viestiä keskenään ja tehdä liiketoimia.
FRSH Nearby toimii rekisterinpitäjänä sellaisten henkilötietojen osalta, joita käsitellään alustan ylläpitämiseksi, käyttäjätilien hallinnoimiseksi, tilausten ja maksujen mahdollistamiseksi, asiakaspalvelun tarjoamiseksi, tietoturvan ylläpitämiseksi, petosten ehkäisemiseksi, Palvelun analysoimiseksi ja kehittämiseksi sekä muihin tässä tietosuojaselosteessa kuvattuihin tarkoituksiin.
Kun Ostaja tekee tilauksen Tuottajalta, tiettyjä henkilötietoja voidaan luovuttaa kyseiselle Tuottajalle siltä osin kuin se on tarpeen tilauksen toteuttamiseksi, noudon tai toimituksen järjestämiseksi, Ostajan kanssa viestimiseksi, elintarviketurvallisuutta tai tuotteiden jäljitettävyyttä koskevien velvoitteiden täyttämiseksi, reklamaatioiden tai takaisinvetojen käsittelemiseksi taikka kirjanpitoa tai muita lakisääteisiä velvoitteita varten.
Tuottaja voi tällaisissa tilanteissa käsitellä tiettyjä henkilötietoja itsenäisenä rekisterinpitäjänä omiin tarkoituksiinsa ja omien lakisääteisten velvoitteidensa täyttämiseksi. Tällaiseen käsittelyyn sovelletaan Tuottajan omia sovellettavan tietosuojalainsäädännön mukaisia velvollisuuksia.
FRSH Nearby ei vastaa Tuottajien FRSH Nearby -Palvelun ulkopuolella itsenäisesti suorittamasta henkilötietojen käsittelystä.

3. Henkilötietojen käsittelyn tarkoitukset ja oikeusperusteet
FRSH Nearby käsittelee henkilötietoja ainoastaan silloin, kun käsittelylle on asianmukainen oikeusperuste.
Käyttäjätilien luominen, ylläpitäminen ja käyttäjien tunnistaminen
(Sopimuksen täytäntöönpano, GDPR 6 artiklan 1 kohdan b alakohta)
Markkinapaikan ja sen toimintojen tarjoaminen
(Sopimuksen täytäntöönpano, GDPR 6 artiklan 1 kohdan b alakohta)
Tilausten käsittely ja mahdollistaminen
(Sopimuksen täytäntöönpano, GDPR 6 artiklan 1 kohdan b alakohta)
Maksujen, hyvitysten ja Tuottajille suoritettavien maksujen mahdollistaminen
(Sopimuksen täytäntöönpano ja soveltuvin osin lakisääteisten velvoitteiden noudattaminen, GDPR 6 artiklan 1 kohdan b ja c alakohdat)
Kirjanpito-, verotus- ja tapahtumatietojen säilyttäminen
(Lakisääteisten velvoitteiden noudattaminen, GDPR 6 artiklan 1 kohdan c alakohta)
Asiakaspalvelu ja riitojen käsittely
(Sopimuksen täytäntöönpano ja oikeutetut edut, GDPR 6 artiklan 1 kohdan b ja f alakohdat)
Petosten ja väärinkäytösten ehkäiseminen sekä alustan turvallisuuden ylläpitäminen
(Oikeutetut edut ja soveltuvin osin lakisääteisten velvoitteiden noudattaminen, GDPR 6 artiklan 1 kohdan f ja c alakohdat)
Tuottajien, yritysten ja käyttäjätilitietojen tarkistaminen
(Sopimuksen täytäntöönpano, oikeutetut edut ja soveltuvin osin lakisääteiset velvoitteet)
Tarkan laitesijainnin käyttäminen sijaintiin perustuvien toimintojen tarjoamiseksi
(Suostumus, GDPR 6 artiklan 1 kohdan a alakohta, silloin kun suostumus vaaditaan)
Osoitteen, kunnan tai käyttäjän vapaaehtoisesti ilmoittaman sijainnin käyttäminen markkinapaikan toimintojen tarjoamiseksi
(Sopimuksen täytäntöönpano ja/tai oikeutetut edut käsittelyn luonteesta riippuen)
Tilausvahvistusten, turvallisuusilmoitusten ja muiden välttämättömien palveluviestien lähettäminen
(Sopimuksen täytäntöönpano ja oikeutetut edut)
Odotuslistan hallinnointi ja palvelun julkaisemiseen liittyvä viestintä
(Suostumus ja/tai käyttäjän pyynnöstä toteutettavat toimenpiteet ennen sopimuksen tekemistä)
Uutiskirjeet ja sähköinen suoramarkkinointi
(Suostumus silloin, kun sovellettava lainsäädäntö sitä edellyttää)
Sisäinen analytiikka ja Palvelun kehittäminen
(Oikeutetut edut silloin, kun se on sallittua; suostumus silloin, kun käytettävä teknologia sitä lain mukaan edellyttää)
Henkilökohtaiset tuote- tai Tuottajasuositukset
(Oikeutetut edut ja tarvittaessa suostumus)
Oikeusvaateiden laatiminen, esittäminen tai puolustaminen
(Oikeutetut edut ja lakisääteisten velvoitteiden noudattaminen)
Viranomaisten lainmukaisiin pyyntöihin vastaaminen
(Lakisääteisten velvoitteiden noudattaminen)
Yritysjärjestelyt, uudelleenjärjestelyt, rahoitus tai due diligence -tarkastukset
(Oikeutetut edut asianmukaisin suojatoimin)
Kun FRSH Nearby perustaa henkilötietojen käsittelyn oikeutettuun etuun, arvioimme, onko käsittely tarpeellista ja oikeasuhteista sekä syrjäyttävätkö rekisteröidyn edut, perusoikeudet tai -vapaudet FRSH Nearbyn oikeutetut edut.

4. Käsiteltävät henkilötietoryhmät
Riippuen siitä, miten henkilö käyttää Palvelua, FRSH Nearby voi käsitellä tunnistamis- ja käyttäjätilitietoja, kuten nimeä, käyttäjänimeä, sähköpostiosoitetta, puhelinnumeroa, käyttäjätilin tyyppiä, profiilitietoja ja sisäisiä käyttäjätunnisteita.
Voimme käsitellä tunnistautumiseen liittyviä tietoja, kuten tunnistautumistunnisteita, kirjautumistietoja, turvallisuustietoja ja tunnistautumistunnuksia. Myös kolmannen osapuolen tunnistautumispalvelut voivat käsitellä käyttäjän tunnistautumistietoja suoraan. FRSH Nearbyn tarkoituksena ei ole säilyttää salasanoja selväkielisessä muodossa.
Voimme käsitellä osoite- ja sijaintitietoja, kuten laskutusosoitetta, toimitusosoitetta, noutopaikkaa, kuntaa, käyttäjän vapaaehtoisesti ilmoittamaa sijaintia, likimääräistä sijaintia sekä käyttäjän luvalla tarkkaa GPS- tai laitesijaintia.
Tapahtumatietoihin voivat kuulua tilaukset, ostetut tuotteet, määrät, hinnat, alennukset, aikaleimat, maksun tila, hyvitystiedot, toimitus- tai noutotiedot, tapahtumatunnisteet ja tilaushistoria.
Maksuihin liittyviin tietoihin voivat kuulua maksutapahtumien ja Tuottajille suoritettavien maksujen mahdollistamiseksi tarvittavat tiedot. Täydelliset maksukorttinumerot, korttien turvakoodit ja vastaavat maksutunnisteet käsitellään yleensä suoraan valtuutettujen maksupalveluntarjoajien toimesta eikä FRSH Nearby säilytä niitä.
Tuottajien ja yrityskäyttäjien osalta voimme lisäksi käsitellä yrityksen nimeä, Y-tunnusta, ALV-tietoja, yrityksen yhteystietoja, tarvittaessa pankki- tai maksutilityksiin liittyviä tietoja, varmennustietoja, tuotetietoja, nouto- tai toimituspaikkoja sekä tietoja Tuottajan toiminnasta markkinapaikalla.
Voimme käsitellä käyttäjien ja FRSH Nearbyn välistä viestintää, asiakaspalvelupyyntöjä, reklamaatioita, riitoja koskevia tietoja, arvioita, arvosteluja ja muuta Palveluun vapaaehtoisesti toimitettua sisältöä.
Teknisiä tietoja voivat olla IP-osoite, laitetyyppi, laitetunnisteet, käyttöjärjestelmä, selaintyyppi, sovelluksen versio, kieliasetukset, tunnistautumistapahtumat, kaatumistiedot, lokitiedot, istuntotiedot sekä muut Palvelun turvallisen toiminnan edellyttämät tiedot.
Palvelun käyttötietoihin voivat kuulua haut, katsotut tuotteet, katsotut Tuottajat, vuorovaikutus markkinapaikan toimintojen kanssa, navigointi Palvelussa, tilaustoiminta ja muut vastaavat Palvelun käyttöä koskevat tiedot.
Kun push-ilmoitukset ovat käytössä, voimme käsitellä laitteen tai push-ilmoitusten tunnistetta sekä ilmoitusten toimittamiseksi tarvittavia tietoja.

5. Tarkat sijaintitiedot
Tietyt FRSH Nearbyn toiminnot voivat käyttää käyttäjän laitteen sijaintia lähellä olevien Tuottajien, tuotteiden, noutopaikkojen, toimitusvaihtoehtojen tai muun maantieteellisesti merkityksellisen sisällön näyttämiseksi.
Jos tarkan laitesijainnin käyttäminen edellyttää suostumusta tai laitteen käyttöoikeuden myöntämistä, FRSH Nearby pyytää kyseistä lupaa ennen sijaintitietojen käyttämistä.
Käyttäjä voi yleensä peruuttaa tarkan sijainnin käyttöoikeuden käyttöjärjestelmän tai laitteen asetuksista. Tietyt sijaintiin perustuvat toiminnot voivat lakata toimimasta tai niiden tarkkuus voi heikentyä, jos sijaintitiedot poistetaan käytöstä.
Käyttäjille voidaan mahdollisuuksien mukaan tarjota vaihtoehtoja, kuten osoitteen, kunnan tai muun sijaintitiedon syöttämistä manuaalisesti jatkuvan tai tarkan GPS-sijainnin jakamisen sijaan.
FRSH Nearby ei pyri seuraamaan käyttäjän tarkkaa sijaintia jatkuvasti silloin, kun kyseinen toiminto ei sitä edellytä.

6. Kolmansilta osapuolilta saadut tiedot
FRSH Nearby kerää henkilötiedot ensisijaisesti suoraan käyttäjiltä.
Henkilötietoja voidaan saada myös maksupalveluntarjoajilta, tunnistautumispalvelujen tarjoajilta, soveltuvin osin toimitus- tai logistiikkakumppaneilta, tapahtumaan osallistuvilta Tuottajilta tai Ostajilta, julkisista yritysrekistereistä, viranomaisilta, petosten torjuntaa tai turvallisuutta tarjoavilta palveluntarjoajilta sekä muilta palveluntarjoajilta silloin, kun tietojen saaminen on tarpeellista ja lainmukaista.
Jos käyttäjä kirjautuu sisään kolmannen osapuolen tunnistautumispalvelun kautta, FRSH Nearby voi saada esimerkiksi käyttäjän nimen, sähköpostiosoitteen, käyttäjätilin tunnisteen tai muita tietoja, joiden luovuttamiseen käyttäjä on kyseisen palvelun kautta antanut luvan.

7. Julkiset tiedot ja Tuottajien profiilit
Tiettyjen Tuottajien vapaaehtoisesti toimittamien tietojen tarkoituksena on olla julkisesti näkyvissä tai muiden Palvelun käyttäjien nähtävillä.
Tällaisia tietoja voivat olla Tuottajan yrityksen nimi tai markkinointinimi, profiilikuva, kuvaus, yleinen sijainti, tuotteet, hinnat, toimitus- tai noutotiedot, arviot sekä muut markkinapaikkaa koskevat tiedot.
Käyttäjien ei tule sisällyttää julkisiin profiileihin, tuotekuvauksiin, arvosteluihin tai muuhun julkisesti näkyvään sisältöön tarpeettomia henkilötietoja, luottamuksellisia tietoja tai arkaluonteisia tietoja.

8. Erityiset henkilötietoryhmät
FRSH Nearby ei yleensä edellytä käyttäjiltä GDPR:n 9 artiklassa tarkoitettujen erityisiin henkilötietoryhmiin kuuluvien henkilötietojen, kuten terveydentilaa, uskontoa, poliittisia mielipiteitä, biometriseen tunnistamiseen liittyviä tietoja tai seksuaalista suuntautumista koskevien tietojen, antamista.
Käyttäjiä pyydetään olemaan antamatta tällaisia tietoja vapaamuotoisissa tekstikentissä, asiakaspalveluviestinnässä, arvosteluissa tai muussa sisällössä, ellei niiden antaminen ole aidosti tarpeellista.
Jos FRSH Nearbyn on poikkeuksellisesti käsiteltävä erityisiin henkilötietoryhmiin kuuluvia tietoja, käsittely tapahtuu ainoastaan silloin, kun siihen on sovellettavan tietosuojalainsäädännön mukainen asianmukainen oikeusperuste.

9. Henkilötietojen vastaanottajat ja luovuttaminen
Henkilötietoja voidaan tarvittaessa luovuttaa tai saattaa seuraavien tahojen saataville: tapahtumaan osallistuvat Ostajat ja Tuottajat; maksu- ja tilityspalvelujen tarjoajat; tunnistautumis- ja henkilöllisyyden varmentamispalvelujen tarjoajat; pilvi-infrastruktuurin ja hosting-palvelujen tarjoajat; tietokanta- ja tietojärjestelmäpalvelujen tarjoajat; sähköposti-, viestintä- ja ilmoituspalvelujen tarjoajat; kartta- ja sijaintipalvelujen tarjoajat; analytiikka- ja palvelunvalvontapalvelujen tarjoajat; petosten torjunta- ja kyberturvallisuuspalvelujen tarjoajat; asiakaspalvelun palveluntarjoajat; ammatilliset neuvonantajat, kuten kirjanpitäjät, tilintarkastajat ja oikeudelliset neuvonantajat; sekä muut Palvelun tarjoamisen kannalta tarpeelliset tekniset alihankkijat.
FRSH Nearby voi luovuttaa henkilötietoja tuomioistuimille, lainvalvontaviranomaisille, valvontaviranomaisille, veroviranomaisille ja muille viranomaisille silloin, kun sovellettava lainsäädäntö sitä edellyttää tai sallii.
Henkilötietoja voidaan luovuttaa myös yrityskaupan, yritysoston, rahoitusjärjestelyn, omaisuuden myynnin, uudelleenjärjestelyn tai vastaavan yritysjärjestelyn yhteydessä asianmukaisia salassapito- ja tietosuojatoimia noudattaen.
FRSH Nearby ei myy henkilötietoja kolmansille osapuolille.
Kun kolmannet osapuolet käsittelevät henkilötietoja yksinomaan FRSH Nearbyn puolesta, FRSH Nearby pyrkii käyttämään GDPR:n 28 artiklan edellyttämiä asianmukaisia sopimusjärjestelyjä.
Tietyt kolmannet osapuolet, kuten maksupalveluntarjoajat, sovelluskauppojen ylläpitäjät, Tuottajat tai muut tahot, voivat sen sijaan käsitellä henkilötietoja itsenäisinä rekisterinpitäjinä omiin tarkoituksiinsa. Tällaiseen käsittelyyn sovelletaan kyseisten tahojen omia tietosuojaselosteita ja sovellettavaa lainsäädäntöä.

10. Maksupalvelut
Maksut, hyvitykset ja Tuottajille suoritettavat tilitykset voidaan käsitellä kolmansien osapuolten maksupalveluntarjoajien kautta.
Tällaiset palveluntarjoajat voivat käsitellä tunnistamis-, tapahtuma-, maksutapa-, pankki- ja petostentorjuntatietoja sekä muita tietoja, jotka ovat tarpeen maksujen suorittamiseksi ja rahoitusalan sääntelyn noudattamiseksi.
Maksupalveluntarjoajat voivat toimia itsenäisinä rekisterinpitäjinä sellaisten käsittelytoimien osalta, joita maksupalveluja, petosten torjuntaa, rahanpesun estämistä, kirjanpitoa tai muuta sovellettavaa lainsäädäntöä koskevat velvoitteet edellyttävät.
FRSH Nearby ei yleensä vastaanota tai säilytä täydellisiä korttitietoja silloin, kun käyttäjä toimittaa kyseiset tiedot suoraan maksupalveluntarjoajalle.

11. Evästeet, SDK:t ja vastaavat teknologiat
FRSH Nearbyn verkkosivusto ja sovellus voivat käyttää evästeitä, paikallista tallennustilaa, ohjelmistokehityspaketteja ("SDK"), laitetunnisteita ja muita vastaavia teknologioita.
Jotkin teknologiat ovat välttämättömiä tunnistautumista, turvallisuutta, käyttäjän valintojen muistamista, istuntojen ylläpitämistä ja Palvelun olennaisten toimintojen tarjoamista varten.
Sovellettavan lainsäädännön niin edellyttäessä analytiikkaan, mainontaan, mittaamiseen tai muihin ei-välttämättömiin tarkoituksiin käytettäviä teknologioita ei aktivoida ennen kuin käyttäjä on antanut tarvittavan suostumuksen.
Kun käsittely perustuu suostumukseen, käyttäjille tarjotaan mahdollisuus hallita valintojaan tai peruuttaa suostumuksensa.
Lisätietoja FRSH Nearbyn verkkosivustolla käytettävistä teknologioista voidaan antaa erillisessä evästekäytännössä tai evästeasetusten hallintatyökalussa.

12. Analytiikka ja Palvelun kehittäminen
FRSH Nearby voi analysoida Palvelun käyttöä koskevia tietoja teknisten ongelmien tunnistamiseksi, toimintojen suorituskyvyn ymmärtämiseksi, käytettävyyden parantamiseksi, uusien toimintojen kehittämiseksi, markkinapaikan toiminnan mittaamiseksi sekä Palvelun luotettavuuden ja turvallisuuden ylläpitämiseksi.
FRSH Nearby voi mahdollisuuksien mukaan käyttää analytiikkaan ja kehittämiseen koottuja, pseudonymisoituja tai anonymisoituja tietoja.
Tietoja, jotka on peruuttamattomasti anonymisoitu siten, ettei henkilöä enää voida tunnistaa, ei pidetä GDPR:n mukaisina henkilötietoina.

13. Markkinointi ja viestintä
FRSH Nearby voi lähettää Palvelun toiminnan kannalta välttämättömiä viestejä, kuten tilausvahvistuksia, tilausmuutoksia, maksutietoja, käyttäjätili-ilmoituksia, turvallisuusviestejä, asiakaspalveluvastauksia ja ilmoituksia Palveluun tehtävistä olennaisista muutoksista.
Tällaisia välttämättömiä palveluviestejä ei pidetä vapaaehtoisena markkinointiviestintänä.
FRSH Nearby voi erikseen lähettää uutiskirjeitä, markkinointiviestejä ja muuta suoramarkkinointia silloin, kun sovellettava lainsäädäntö sen sallii.
Jos markkinointi perustuu suostumukseen, vastaanottaja voi peruuttaa suostumuksensa milloin tahansa. Markkinointiviestien peruuttaminen ei estä FRSH Nearbyta lähettämästä olemassa olevan käyttäjätilin, tilauksen, tapahtuman tai lakisääteisen velvoitteen kannalta välttämättömiä viestejä.

14. Automaattinen päätöksenteko ja profilointi
FRSH Nearby voi käyttää automaattista käsittelyä sisällön personointiin, Tuottajien ja tuotteiden järjestämiseen tai suosittelemiseen, mahdollisesti petollisen tai epätavallisen toiminnan tunnistamiseen, markkinapaikan toimintojen parantamiseen sekä Palvelun käytön analysointiin.
Suosituksissa voidaan ottaa huomioon esimerkiksi käyttäjän sijainti, haut, katsotut tuotteet, aikaisemmat tilaukset, saatavuus, toimituspäivät tai muu käyttäjän vuorovaikutus Palvelun kanssa.
FRSH Nearby ei aio tehdä yksinomaan automaattiseen käsittelyyn perustuvia päätöksiä, joilla on käyttäjää koskevia oikeusvaikutuksia tai jotka vaikuttavat käyttäjään vastaavalla tavalla merkittävästi GDPR:n 22 artiklassa tarkoitetulla tavalla.
Jos FRSH Nearby ottaa tulevaisuudessa käyttöön tällaisen automaattisen päätöksenteon, käyttäjille annetaan sovellettavan lainsäädännön edellyttämät lisätiedot ja suojatoimet.

15. Henkilötietojen siirrot EU:n ja ETA:n ulkopuolelle
Jotkin FRSH Nearbyn käyttämät palveluntarjoajat voivat käsitellä henkilötietoja Euroopan unionin tai Euroopan talousalueen ulkopuolella.
Kun henkilötietoja siirretään ETA:n ulkopuolelle, FRSH Nearby ryhtyy toimenpiteisiin varmistaakseen, että siirto toteutetaan lainmukaista siirtomekanismia käyttäen ja että henkilötietojen asianmukainen suojaustaso säilyy.
Tilanteesta riippuen tällaisia mekanismeja voivat olla Euroopan komission tekemä tietosuojan riittävyyttä koskeva päätös, Euroopan komission hyväksymät vakiosopimuslausekkeet tai muu GDPR:n V luvun sallima siirtomekanismi.
Tarvittaessa voidaan lisäksi käyttää täydentäviä teknisiä, sopimuksellisia tai organisatorisia suojatoimia.
Sovellettavia siirtojen suojatoimia koskevia lisätietoja voi pyytää tässä tietosuojaselosteessa ilmoitettujen tietosuojayhteystietojen kautta.
FRSH Nearby säilyttää tietonsa Euroopassa sovellettavien säännösten mukaisesti.

16. Henkilötietojen säilytysajat
FRSH Nearby säilyttää henkilötietoja vain niin kauan kuin se on tarpeen niiden tarkoitusten toteuttamiseksi, joita varten tiedot on kerätty, ja tämän jälkeen ainoastaan silloin, kun tietojen säilyttäminen on sovellettavan lainsäädännön mukaan tarpeellista tai perusteltua.
Käyttäjätilitietoja säilytetään yleensä niin kauan kuin käyttäjätili on aktiivinen ja asianmukaisen ajan käyttäjätilin sulkemisen jälkeen silloin, kun se on tarpeen keskeneräisten tapahtumien, riitojen, petosten ehkäisemisen, oikeusvaateiden tai lakisääteisten velvoitteiden hoitamiseksi.
Tilaus-, tapahtuma-, maksu- ja kirjanpitotietoja voidaan säilyttää kirjanpito-, verotus- ja muun sovellettavan lainsäädännön edellyttämien säilytysaikojen mukaisesti.
Asiakaspalveluviestintää voidaan säilyttää asianmukaisen ajan asian ratkaisemisen jälkeen, jos se on tarpeen asian käsittelyn dokumentoimiseksi tai oikeusvaateen laatimiseksi, esittämiseksi tai puolustamiseksi.
Turvallisuus- ja teknisiä lokitietoja säilytetään vain niin kauan kuin se on kohtuullisesti tarpeen turvallisuutta, vianmääritystä, petosten ehkäisemistä ja järjestelmien hallintaa varten.
Odotuslistaan ja suostumukseen perustuvaan markkinointiin liittyvät tiedot poistetaan tai niiden käyttö estetään, kun suostumus peruutetaan tai tietoja ei enää tarvita kyseiseen tarkoitukseen. Rajoitettuja tietoja voidaan kuitenkin säilyttää suostumuksen peruuttamisen dokumentoimiseksi tai tulevan markkinoinnin estämiseksi.
Varmuuskopioissa olevia tietoja voi säilyä tilapäisesti poistamisen jälkeen siihen saakka, kunnes ne korvataan FRSH Nearbyn varmuuskopiointi- ja palautusmenettelyjen mukaisesti.
FRSH Nearby arvioi säännöllisesti, ovatko säilytettävät henkilötiedot edelleen tarpeellisia.

17. Käyttäjätilin sulkeminen ja tietojen poistaminen
Käyttäjät voivat pyytää FRSH Nearby -käyttäjätilinsä sulkemista Palvelussa olevan tilinpoistotoiminnon kautta, mikäli tällainen toiminto on saatavilla, tai ottamalla yhteyttä FRSH Nearbyhin.
Käyttäjätilin sulkeminen tai poistaminen ei välttämättä johda kaikkien tiliin liittyvien tietojen välittömään poistamiseen.
FRSH Nearby voi edelleen säilyttää tietoja silloin, kun se on tarpeen lakisääteisten kirjanpito- tai verotusvelvoitteiden noudattamiseksi, keskeneräisten tapahtumien suorittamiseksi, riitojen käsittelemiseksi, petosten ehkäisemiseksi, sopimusten täytäntöönpanemiseksi, oikeuksien suojaamiseksi tai muiden sovellettavien lakisääteisten velvoitteiden täyttämiseksi.
Tiedot, joita ei enää tarvitse säilyttää, poistetaan tai anonymisoidaan FRSH Nearbyn säilytyskäytäntöjen mukaisesti.

18. Rekisteröidyn oikeudet
Sovellettavan lainsäädännön vaatimusten ja rajoitusten mukaisesti rekisteröidyllä voi olla oikeus:
•	saada pääsy häntä koskeviin henkilötietoihin;
•	pyytää virheellisten tai puutteellisten henkilötietojen oikaisemista;
•	pyytää henkilötietojen poistamista;
•	pyytää henkilötietojen käsittelyn rajoittamista;
•	vastustaa oikeutettuun etuun perustuvaa henkilötietojen käsittelyä;
•	vastustaa milloin tahansa henkilötietojen käsittelyä suoramarkkinointia varten;
•	saada soveltuvat henkilötietonsa jäsennellyssä, yleisesti käytetyssä ja koneellisesti luettavassa muodossa sekä siirtää kyseiset tiedot toiselle rekisterinpitäjälle;
•	peruuttaa suostumuksensa silloin, kun käsittely perustuu suostumukseen; sekä
•	käyttää soveltuvia automaattiseen päätöksentekoon liittyviä oikeuksiaan.
Oikeuden käyttäminen voi riippua käsittelyn olosuhteista ja oikeusperusteesta. Esimerkiksi oikeus tietojen poistamiseen ei velvoita FRSH Nearbyta poistamaan tietoja, jotka sen on säilytettävä lakisääteisen velvoitteen perusteella.
FRSH Nearby voi pyytää sellaisia tietoja, jotka ovat kohtuullisesti tarpeen tietosuojaa koskevan pyynnön esittäjän henkilöllisyyden varmistamiseksi.
Pyynnöt voidaan toimittaa kohdassa 1 ilmoitettuja yhteystietoja käyttäen.

19. Suostumuksen peruuttaminen
Jos henkilötietojen käsittely perustuu suostumukseen, rekisteröity voi peruuttaa suostumuksensa milloin tahansa.
Käsittelystä riippuen suostumus voidaan peruuttaa käyttäjätilin asetuksista, laitteen käyttöoikeusasetuksista, evästeasetuksista, markkinointiviestissä olevan peruutustoiminnon kautta tai ottamalla yhteyttä FRSH Nearby:hin.
Suostumuksen peruuttaminen ei vaikuta ennen sen peruuttamista suoritetun henkilötietojen käsittelyn lainmukaisuuteen.
Jos tietyn vapaaehtoisen toiminnon käyttäminen edellyttää kyseistä suostumusta, kyseinen toiminto voi lakata olemasta käytettävissä suostumuksen peruuttamisen jälkeen.

20. Oikeus tehdä valitus valvontaviranomaiselle
Rekisteröidyllä, joka katsoo FRSH Nearbyn käsitelleen henkilötietoja sovellettavan tietosuojalainsäädännön vastaisesti, on oikeus tehdä valitus toimivaltaiselle tietosuojaviranomaiselle.
FRSH Nearbyn Suomessa harjoittaman toiminnan osalta asianomainen valvontaviranomainen on Tietosuojavaltuutetun toimisto.
Tilanteesta riippuen rekisteröidyllä voi myös olla oikeus tehdä valitus jonkin muun EU- tai ETA-valtion valvontaviranomaiselle, mukaan lukien sen jäsenvaltion valvontaviranomaiselle, jossa rekisteröity tavallisesti asuu, työskentelee tai jossa väitetty rikkomus on tapahtunut.
Kannustamme käyttäjiä ottamaan soveltuvissa tilanteissa ensin yhteyttä FRSH Nearby:hin, jotta voimme tutkia asian ja pyrkiä ratkaisemaan sen.

21. Henkilötietojen antamisvelvollisuus
Tiettyjen henkilötietojen antaminen on tarpeen, jotta FRSH Nearby voi luoda käyttäjätilin, tarjota Palvelua, mahdollistaa tapahtumia tai noudattaa lakisääteisiä velvoitteitaan.
Palvelusta riippuen pakollisia tietoja voivat olla tunnistamis- ja yhteystiedot, käyttäjätilitiedot, tilaustiedot, toimitus- tai noutotiedot sekä maksujen käsittelyyn tai Tuottajan varmentamiseen tarvittavat tiedot.
Jos Palvelun tarjoamisen kannalta välttämättömiä tietoja ei anneta, FRSH Nearby ei välttämättä pysty luomaan käyttäjätiliä, tarjoamaan tiettyjä toimintoja, käsittelemään tilausta, mahdollistamaan maksua tai muutoin tarjoamaan pyydettyä Palvelua.
Vapaaehtoiset tiedot ilmoitetaan tarvittaessa sellaisiksi, ja käyttäjä voi päättää olla antamatta niitä.

22. Lapset ja alaikäiset
Oikeus luoda käyttäjätili ja tehdä liiketoimia FRSH Nearbyn kautta määräytyy FRSH Nearbyn käyttöehtojen ja sovellettavan lainsäädännön mukaisesti.
FRSH Nearby ei tietoisesti pyri keräämään lasten henkilötietoja tilanteissa, joissa tällainen käsittely ei olisi lainmukaista.
Jos alaikäisen henkilötietojen käsittely edellyttää sovellettavan lainsäädännön mukaan vanhemman tai laillisen huoltajan suostumusta tai hyväksyntää, FRSH Nearby voi ryhtyä kohtuullisiin toimenpiteisiin tällaisen suostumuksen tai hyväksynnän saamiseksi tai varmistamiseksi.
Jos FRSH Nearby saa tietää, että lapsen henkilötietoja on kerätty lainvastaisesti, ryhdymme asianmukaisiin toimenpiteisiin tietojen poistamiseksi tai niiden käsittelemiseksi muutoin lainmukaisella tavalla.

23. Henkilötietojen suojaaminen
FRSH Nearby toteuttaa teknisiä ja organisatorisia toimenpiteitä henkilötietojen suojaamiseksi luvattomalta pääsyltä, luovuttamiselta, muuttamiselta, katoamiselta, tuhoutumiselta ja muulta lainvastaiselta käsittelyltä.
Tällaisia toimenpiteitä voivat olla tiedonsiirron salaus, käyttöoikeuksien hallinta, tunnistautumismekanismit, roolipohjaiset käyttöoikeudet, turvallinen tunnistetietojen käsittely, lokitus, varmuuskopiointi, ohjelmistopäivitykset, valvonta, turvalliset kehityskäytännöt sekä työntekijöiden ja alihankkijoiden henkilötietoihin pääsyn rajoittaminen.
Pääsy henkilötietoihin pyritään rajoittamaan henkilöihin, jotka tarvitsevat tietoja työtehtäviensä hoitamiseksi.
Mikään verkkopalvelu tai sähköinen tallennusmenetelmä ei voi taata täydellistä turvallisuutta. FRSH Nearby arvioi ja kehittää tämän vuoksi tietoturvakäytäntöjään jatkuvasti Palvelun luonteen ja henkilötietojen käsittelyyn liittyvien riskien mukaisesti.

24. Henkilötietojen tietoturvaloukkaukset
FRSH Nearby ylläpitää menettelyjä epäiltyjen henkilötietojen tietoturvaloukkausten tunnistamiseksi, arvioimiseksi ja käsittelemiseksi.
Jos henkilötietojen tietoturvaloukkaus kuuluu sovellettavan tietosuojalainsäädännön mukaisen ilmoitusvelvollisuuden piiriin, FRSH Nearby ilmoittaa asiasta toimivaltaiselle valvontaviranomaiselle ja, silloin kun laki sitä edellyttää, asianomaisille rekisteröidyille.

25. Kolmansien osapuolten palvelut ja ulkoiset linkit
Palvelu voi sisältää linkkejä verkkosivustoille, karttapalveluihin, maksupalveluihin, sovelluskauppoihin, tunnistautumispalveluihin tai muihin kolmansien osapuolten ylläpitämiin palveluihin.
Kun henkilö siirtyy käyttämään kolmannen osapuolen palvelua, kyseinen kolmas osapuoli voi käsitellä henkilötietoja omien käyttöehtojensa ja tietosuojaselosteensa mukaisesti.
FRSH Nearbyn tietosuojaselostetta ei sovelleta tällaisten kolmansien osapuolten itsenäisesti suorittamaan henkilötietojen käsittelyyn.

26. Henkilötietojen käsittelyn tarkoitusten muuttaminen
Jos FRSH Nearby aikoo käsitellä henkilötietoja tarkoitukseen, joka poikkeaa olennaisesti siitä tarkoituksesta, jota varten tiedot alun perin kerättiin, FRSH Nearby arvioi uuden käsittelyn lainmukaisuuden ja antaa tarvittaessa asianomaisille rekisteröidyille lisätietoja ennen uuden käsittelyn aloittamista.
Jos uusi käsittely edellyttää suostumusta, FRSH Nearby hankkii kyseisen suostumuksen ennen käsittelyn aloittamista.

27. Muutokset tähän tietosuojaselosteeseen
FRSH Nearby voi muuttaa tätä tietosuojaselostetta Palvelun, henkilötietojen käsittelytoimien, palveluntarjoajien, teknologian, lainsäädännön, viranomaisohjeiden tai liiketoiminnan muutosten huomioon ottamiseksi.
Tietosuojaselosteen kulloinkin voimassa oleva versio asetetaan saataville FRSH Nearbyn verkkosivustolla ja/tai sovelluksessa.
Jos muutokset vaikuttavat olennaisesti henkilötietojen käsittelyyn tai käyttäjien oikeuksiin, FRSH Nearby ilmoittaa muutoksista asianmukaisella tavalla ennen niiden voimaantuloa silloin, kun sovellettava lainsäädäntö sitä edellyttää.
Tämän tietosuojaselosteen alussa ilmoitettu päivämäärä kertoo, milloin selostetta on viimeksi päivitetty.

28. Yhteystiedot
Tietosuojaa tai henkilötietojen käsittelyä koskevat kysymykset, pyynnöt ja huolenaiheet voidaan osoittaa seuraavasti:

FRSH Nearby Ab
Sähköposti: info@frshnearby.com
Postiosoite: Hovrättsesplanaden 23 A 20, 65100 Vaasa, Suomi.
''',
);

const _sv = _PrivacyPolicyCopy(
  title: 'Integritetspolicy',
  updated: 'Senast uppdaterad: 15 september 2026',
  closeLabel: 'Stäng',
  linkLabel: 'integritetspolicyn',
  body: '''
INTEGRITETSPOLICY

Senast uppdaterad: 15 september 2026

Denna integritetspolicy förklarar hur FRSH Nearby Ab ("FRSH Nearby", "FRSH", "vi", "oss" eller "vår") samlar in, använder, lagrar, delar och på annat sätt behandlar personuppgifter i samband med FRSH Nearbys webbplats, mobilapplikation, digitala marknadsplats och relaterade tjänster (gemensamt "Tjänsten").
Denna integritetspolicy gäller konsumenter, företagskunder, producenter, företagsproducenter, personer som ansluter sig till en väntelista, besökare på webbplatsen och andra personer vars personuppgifter behandlas i samband med Tjänsten.
FRSH Nearby behandlar personuppgifter i enlighet med Europaparlamentets och rådets allmänna dataskyddsförordning (EU) 2016/679 ("GDPR"), Finlands dataskyddslag (1050/2018) samt annan tillämplig lagstiftning om dataskydd och elektronisk kommunikation.

1. Personuppgiftsansvarig och kontaktuppgifter
Den personuppgiftsansvarige för den behandling som beskrivs i denna integritetspolicy är:
FRSH Nearby Ab
FO-nummer: 3640701-3
Registrerad adress: Hovrättsesplanaden 23 A 20, 65100 Vasa, Finland
E-post för dataskyddsärenden: info@frshnearby.com
Frågor som gäller denna integritetspolicy, behandling av personuppgifter eller utövandet av rättigheter enligt dataskyddslagstiftningen kan riktas till ovanstående e-postadress.

2. FRSH Nearbys, Köparnas och Producenternas roller
FRSH Nearby driver en digital marknadsplats genom vilken Köpare och Producenter kan hitta produkter, kommunicera med varandra och genomföra transaktioner.
FRSH Nearby fungerar som personuppgiftsansvarig för personuppgifter som behandlas för att driva plattformen, administrera användarkonton, möjliggöra beställningar och betalningar, tillhandahålla kundsupport, upprätthålla säkerheten, förebygga bedrägerier, analysera och utveckla Tjänsten samt utföra annan behandling som beskrivs i denna integritetspolicy.
När en Köpare gör en beställning hos en Producent kan vissa personuppgifter lämnas ut till Producenten i den utsträckning det är nödvändigt för att fullgöra beställningen, ordna avhämtning eller leverans, kommunicera med Köparen, uppfylla skyldigheter avseende livsmedelssäkerhet eller produktspårbarhet, hantera reklamationer eller återkallelser eller uppfylla bokföringsmässiga eller andra rättsliga skyldigheter.
En Producent kan i sådana situationer behandla vissa personuppgifter som självständig personuppgiftsansvarig för sina egna ändamål och rättsliga skyldigheter. Sådan behandling omfattas av Producentens eget ansvar enligt tillämplig dataskyddslagstiftning.
FRSH Nearby ansvarar inte för sådan behandling som Producenter självständigt utför utanför FRSH Nearby-Tjänsten.

3. Ändamål och rättsliga grunder för behandlingen
FRSH Nearby behandlar personuppgifter endast när det finns en lämplig rättslig grund för behandlingen.
Skapande, underhåll och autentisering av användarkonton
(Fullgörande av avtal, artikel 6.1 b GDPR)
Tillhandahållande av marknadsplatsen och dess funktioner
(Fullgörande av avtal, artikel 6.1 b GDPR)
Behandling och möjliggörande av beställningar
(Fullgörande av avtal, artikel 6.1 b GDPR)
Möjliggörande av betalningar, återbetalningar och utbetalningar till Producenter
(Fullgörande av avtal och, i tillämpliga fall, fullgörande av rättsliga förpliktelser, artikel 6.1 b och c GDPR)
Upprätthållande av bokförings-, skatte- och transaktionsuppgifter
(Fullgörande av rättsliga förpliktelser, artikel 6.1 c GDPR)
Kundsupport och hantering av tvister
(Fullgörande av avtal och berättigade intressen, artikel 6.1 b och f GDPR)
Förebyggande av bedrägerier och missbruk samt upprätthållande av plattformens säkerhet
(Berättigade intressen och, i tillämpliga fall, rättsliga förpliktelser, artikel 6.1 f och c GDPR)
Verifiering av Producenter, företag och kontouppgifter
(Fullgörande av avtal, berättigade intressen och rättsliga förpliktelser, beroende på situationen)
Tillhandahållande av platsbaserade funktioner med hjälp av exakt enhetsposition
(Samtycke, artikel 6.1 a GDPR, när samtycke krävs)
Användning av adress, kommun eller frivilligt angiven platsinformation för att tillhandahålla marknadsplatsfunktioner
(Fullgörande av avtal och/eller berättigade intressen beroende på behandlingen)
Utskick av orderbekräftelser, säkerhetsmeddelanden och annan nödvändig servicekommunikation
(Fullgörande av avtal och berättigade intressen)
Administration av väntelista och kommunikation i samband med lansering
(Samtycke och/eller åtgärder som vidtas på användarens begäran innan avtal ingås)
Nyhetsbrev och elektronisk direktmarknadsföring
(Samtycke när detta krävs enligt tillämplig lagstiftning)
Intern analys och utveckling av Tjänsten
(Berättigade intressen där detta är tillåtet; samtycke när samtycke krävs enligt lag för den teknik som används)
Personanpassade rekommendationer av produkter eller Producenter
(Berättigade intressen och, där så krävs, samtycke)
Fastställande, utövande eller försvar av rättsliga anspråk
(Berättigade intressen och fullgörande av rättsliga förpliktelser)
Svar på lagliga förfrågningar från myndigheter
(Fullgörande av rättsliga förpliktelser)
Företagstransaktioner, omstrukturering, finansiering eller due diligence
(Berättigade intressen, med lämpliga skyddsåtgärder)
När FRSH Nearby grundar behandlingen på berättigade intressen bedömer vi om behandlingen är nödvändig och proportionerlig samt om våra intressen väger tyngre än den registrerades intressen, grundläggande rättigheter eller friheter.

4. Kategorier av personuppgifter som behandlas
Beroende på hur en person använder Tjänsten kan FRSH Nearby behandla identifierings- och kontouppgifter såsom namn, användarnamn, e-postadress, telefonnummer, kontotyp, profilinformation och interna användaridentifierare.
Vi kan behandla autentiseringsuppgifter såsom autentiseringsidentifierare, inloggningsuppgifter, säkerhetsinformation och autentiseringstokens. Autentiseringsuppgifter kan även behandlas direkt av tredjepartsleverantörer av autentiseringstjänster. FRSH Nearby avser inte att lagra lösenord i klartext.
Vi kan behandla adress- och platsuppgifter, inklusive faktureringsadress, leveransadress, avhämtningsplats, kommun, frivilligt angiven plats, ungefärlig plats och, när användaren har gett tillstånd, exakt GPS- eller enhetsposition.
Transaktionsuppgifter kan omfatta beställningar, köpta produkter, mängder, priser, rabatter, tidsstämplar, betalningsstatus, återbetalningsuppgifter, leverans- eller avhämtningsinformation, transaktionsidentifierare och orderhistorik.
Betalningsrelaterade uppgifter kan omfatta information som behövs för att möjliggöra betalningstransaktioner och utbetalningar. Fullständiga betalkortsnummer, kortsäkerhetskoder och liknande betalningsuppgifter behandlas i regel direkt av auktoriserade betaltjänstleverantörer och lagras inte av FRSH Nearby.
För Producenter och företagsanvändare kan vi dessutom behandla företagsnamn, FO-nummer, momsuppgifter, företagets kontaktuppgifter, bank- eller utbetalningsuppgifter när sådana krävs, verifieringsuppgifter, produktlistningar, avhämtnings- eller leveransplatser samt uppgifter om Producentens verksamhet på marknadsplatsen.
Vi kan behandla kommunikation mellan användare och FRSH Nearby, förfrågningar till kundsupporten, reklamationsuppgifter, uppgifter om tvister, betyg, recensioner och annat innehåll som frivilligt lämnas via Tjänsten.
Tekniska uppgifter kan omfatta IP-adress, enhetstyp, enhetsidentifierare, operativsystem, webbläsartyp, applikationsversion, språkinställningar, autentiseringshändelser, information om krascher, logguppgifter, sessionsinformation och annan information som krävs för att säkra och driva Tjänsten.
Användningsuppgifter kan omfatta sökningar, visade produkter, visade Producenter, interaktioner med marknadsplatsens funktioner, navigering i Tjänsten, beställningsaktivitet och liknande information om användningen av Tjänsten.
När pushnotiser är aktiverade kan vi behandla en enhets- eller pushnotistoken och sådan information som är nödvändig för att leverera meddelanden.

5. Exakta platsuppgifter
Vissa funktioner i FRSH Nearby kan använda användarens enhetsposition för att visa närliggande Producenter, produkter, avhämtningsplatser, leveransalternativ eller annat geografiskt relevant innehåll.
När användning av exakt enhetsposition kräver samtycke eller tillstånd på enheten kommer FRSH Nearby att begära sådant tillstånd innan informationen används.
Användare kan normalt återkalla åtkomsten till exakt platsinformation via operativsystemets eller enhetens inställningar. Vissa platsbaserade funktioner kan bli otillgängliga eller mindre exakta om platsåtkomst stängs av.
När det är möjligt kan användarna erbjudas alternativ, såsom att manuellt ange en adress, kommun eller annan plats i stället för att dela kontinuerlig eller exakt GPS-information.
FRSH Nearby har inte för avsikt att kontinuerligt spåra användarnas exakta position när den aktuella funktionen inte kräver detta.

6. Information som erhålls från tredje parter
FRSH Nearby samlar i första hand in personuppgifter direkt från användarna.
Personuppgifter kan även erhållas från betaltjänstleverantörer, autentiseringsleverantörer, leverans- eller logistikpartner där detta är tillämpligt, Producenter eller Köpare som deltar i en transaktion, offentliga företagsregister, myndigheter, leverantörer av bedrägeribekämpnings- eller säkerhetstjänster samt andra tjänsteleverantörer när det är nödvändigt och lagenligt att inhämta informationen.
När en användare väljer att logga in via en autentiseringstjänst från tredje part kan FRSH Nearby få tillgång till exempelvis användarens namn, e-postadress, kontoidentifierare eller annan information som användaren har godkänt att tjänsten lämnar ut.

7. Offentlig information och Producentprofiler
Viss information som Producenter frivilligt tillhandahåller är avsedd att visas offentligt eller för andra användare av Tjänsten.
Detta kan omfatta Producentens företagsnamn eller handelsnamn, profilbild, beskrivning, allmän platsinformation, produkter, priser, leverans- eller avhämtningsinformation, betyg och annan information om marknadsplatsen.
Användare bör inte inkludera onödiga personuppgifter, konfidentiell information eller känsliga uppgifter i offentliga profiler, produktbeskrivningar, recensioner eller annat offentligt synligt innehåll.

8. Särskilda kategorier av personuppgifter
FRSH Nearby kräver i regel inte att användare lämnar sådana särskilda kategorier av personuppgifter som avses i artikel 9 GDPR, såsom uppgifter om hälsa, religion, politiska åsikter, biometrisk identifiering eller sexuell läggning.
Användare ombeds att inte lämna sådan information i fritextfält, kommunikation med kundsupport, recensioner eller annat innehåll om det inte är genuint nödvändigt.
Om FRSH Nearby undantagsvis behöver behandla särskilda kategorier av personuppgifter sker behandlingen endast om en lämplig rättslig grund enligt tillämplig dataskyddslagstiftning föreligger.

9. Mottagare och utlämnande av personuppgifter
Personuppgifter kan vid behov lämnas ut eller göras tillgängliga för Köpare och Producenter som deltar i en transaktion; leverantörer av betalnings- och utbetalningstjänster; leverantörer av autentiserings- och identitetstjänster; leverantörer av molninfrastruktur och hosting; databas- och informationssystemleverantörer; leverantörer av e-post-, kommunikations- och notifikationstjänster; kart- och platstjänstleverantörer; leverantörer av analys- och övervakningstjänster; leverantörer av bedrägeribekämpnings- och cybersäkerhetstjänster; kundsupportleverantörer; professionella rådgivare såsom bokförare, revisorer och juridiska rådgivare; samt andra tekniska underleverantörer som är nödvändiga för att tillhandahålla Tjänsten.
FRSH Nearby kan lämna ut personuppgifter till domstolar, brottsbekämpande myndigheter, tillsynsmyndigheter, skattemyndigheter och andra offentliga myndigheter när detta krävs eller tillåts enligt tillämplig lagstiftning.
Personuppgifter kan även lämnas ut i samband med fusion, företagsförvärv, finansieringstransaktion, försäljning av tillgångar, omstrukturering eller liknande företagstransaktion, med förbehåll för lämpliga sekretess- och dataskyddsåtgärder.
FRSH Nearby säljer inte personuppgifter till tredje parter.
När tredje parter behandlar personuppgifter enbart på uppdrag av FRSH Nearby strävar FRSH Nearby efter att använda lämpliga avtalsarrangemang i enlighet med artikel 28 GDPR.
Vissa tredje parter, inklusive betaltjänstleverantörer, appbutiksoperatörer, Producenter eller andra parter, kan i stället behandla personuppgifter som självständiga personuppgiftsansvariga för sina egna ändamål. Deras behandling omfattas av deras respektive integritetspolicyer och tillämplig lagstiftning.

10. Betaltjänster
Betalningar, återbetalningar och utbetalningar till Producenter kan behandlas av tredjepartsleverantörer av betaltjänster.
Sådana leverantörer kan behandla identifieringsuppgifter, transaktionsuppgifter, betalningsmetoder, bankuppgifter, uppgifter för bedrägeribekämpning och annan information som behövs för att genomföra betalningar och följa finansiell reglering.
Betaltjänstleverantörer kan agera som självständiga personuppgiftsansvariga för viss behandling som krävs enligt lagstiftning om betaltjänster, bedrägeribekämpning, förhindrande av penningtvätt, bokföring eller annan tillämplig reglering.
FRSH Nearby tar i regel inte emot eller lagrar fullständiga kortuppgifter när dessa lämnas direkt till betaltjänstleverantören.

11. Cookies, SDK:er och liknande tekniker
FRSH Nearbys webbplats och applikation kan använda cookies, lokal lagring, programvaruutvecklingspaket ("SDK:er"), enhetsidentifierare och liknande tekniker.
Vissa tekniker är nödvändiga för autentisering, säkerhet, lagring av användarval, upprätthållande av sessioner och tillhandahållande av grundläggande funktionalitet.
När det krävs enligt tillämplig lagstiftning kommer tekniker för analys, reklam, mätning eller andra icke-nödvändiga ändamål inte att aktiveras förrän användaren har lämnat nödvändigt samtycke.
När behandlingen grundar sig på samtycke ges användarna möjlighet att hantera eller återkalla sina val.
Ytterligare information om de tekniker som används på FRSH Nearbys webbplats kan ges i en separat cookiepolicy eller genom ett gränssnitt för hantering av cookieinställningar.

12. Analys och utveckling av Tjänsten
FRSH Nearby kan analysera information om hur Tjänsten används för att identifiera tekniska problem, förstå hur funktioner presterar, förbättra användbarheten, utveckla nya funktioner, mäta aktiviteten på marknadsplatsen och upprätthålla Tjänstens tillförlitlighet och säkerhet.
När det är rimligt möjligt kan FRSH Nearby använda aggregerad, pseudonymiserad eller anonymiserad information för analys och utveckling.
Information som har anonymiserats oåterkalleligt så att en person inte längre kan identifieras utgör inte personuppgifter enligt GDPR.

13. Marknadsföring och kommunikation
FRSH Nearby kan skicka meddelanden som är nödvändiga för Tjänstens funktion, inklusive orderbekräftelser, ändringar i beställningar, betalningsinformation, kontomeddelanden, säkerhetsmeddelanden, svar från kundsupporten och viktiga förändringar i Tjänsten.
Sådan nödvändig servicekommunikation betraktas inte som frivillig marknadsföringskommunikation.
FRSH Nearby kan separat skicka nyhetsbrev, kampanjmeddelanden och annan direktmarknadsföring när detta är tillåtet enligt tillämplig lagstiftning.
När marknadsföring grundar sig på samtycke kan mottagaren när som helst återkalla sitt samtycke. Att avregistrera sig från marknadsföring hindrar inte FRSH Nearby från att skicka kommunikation som är nödvändig för ett befintligt konto, en beställning, transaktion eller rättslig förpliktelse.

14. Automatiserat beslutsfattande och profilering
FRSH Nearby kan använda automatiserad behandling för att personanpassa innehåll, rangordna eller rekommendera Producenter och produkter, identifiera potentiellt bedräglig eller ovanlig aktivitet, förbättra marknadsplatsens funktionalitet och analysera användningen av Tjänsten.
Rekommendationer kan ta hänsyn till exempelvis platsinformation, sökningar, visade produkter, tidigare beställningar, tillgänglighet, leveransdatum eller interaktioner med Tjänsten.
FRSH Nearby har inte för avsikt att fatta beslut som enbart grundar sig på automatiserad behandling och som medför rättsliga följder för en användare eller på liknande sätt i betydande grad påverkar användaren i den mening som avses i artikel 22 GDPR.
Om FRSH Nearby i framtiden inför sådant automatiserat beslutsfattande kommer användarna att få den ytterligare information och de skyddsåtgärder som krävs enligt tillämplig lagstiftning.

15. Överföringar utanför EU och EES
Vissa tjänsteleverantörer som FRSH Nearby använder kan behandla personuppgifter utanför Europeiska unionen eller Europeiska ekonomiska samarbetsområdet.
När personuppgifter överförs utanför EES vidtar FRSH Nearby åtgärder för att säkerställa att överföringen sker med hjälp av en laglig överföringsmekanism och att en lämplig skyddsnivå upprätthålls.
Beroende på omständigheterna kan sådana mekanismer omfatta ett adekvansbeslut från Europeiska kommissionen, Europeiska kommissionens standardavtalsklausuler eller någon annan överföringsmekanism som är tillåten enligt kapitel V i GDPR.
När så krävs kan kompletterande tekniska, avtalsmässiga eller organisatoriska skyddsåtgärder vidtas.
Information om tillämpliga skyddsåtgärder vid överföring kan begäras via de kontaktuppgifter för dataskydd som anges i denna integritetspolicy.
FRSH Nearby lagrar sina data i Europa i enlighet med tillämpliga bestämmelser.

16. Lagringstid för personuppgifter
FRSH Nearby lagrar personuppgifter endast så länge som det är nödvändigt för de ändamål för vilka informationen samlades in och därefter endast när lagringen krävs eller är motiverad enligt tillämplig lagstiftning.
Kontouppgifter lagras i regel så länge kontot är aktivt och under en lämplig period efter att kontot har stängts när detta är nödvändigt för att hantera utestående transaktioner, tvister, förebyggande av bedrägerier, rättsliga anspråk eller lagstadgade skyldigheter.
Order-, transaktions-, betalnings- och bokföringsuppgifter kan lagras under de tidsperioder som krävs enligt tillämplig bokförings-, skatte- och annan lagstiftning.
Kommunikation med kundsupport kan lagras under en lämplig period efter att ärendet har lösts när detta är nödvändigt för att dokumentera hur ärendet har hanterats eller för att fastställa, göra gällande eller försvara rättsliga anspråk.
Säkerhets- och tekniska loggar lagras endast under den tid som rimligen är nödvändig för säkerhet, felsökning, bedrägeribekämpning och systemadministration.
Uppgifter om väntelistor och samtyckesbaserad marknadsföring raderas eller spärras när samtycket återkallas eller när informationen inte längre behövs för det aktuella ändamålet. Begränsade uppgifter kan dock behållas för att dokumentera återkallandet eller förhindra ytterligare marknadsföring.
Säkerhetskopior kan tillfälligt finnas kvar efter radering tills de skrivs över enligt FRSH Nearbys rutiner för säkerhetskopiering och återställning.
FRSH Nearby granskar regelbundet om personuppgifter fortfarande behöver lagras.

17. Stängning och radering av användarkonto
Användare kan begära att deras FRSH Nearby-konto stängs genom en funktion för kontoradering i Tjänsten, om en sådan funktion är tillgänglig, eller genom att kontakta FRSH Nearby.
Att stänga eller radera ett konto innebär inte nödvändigtvis att all information som är kopplad till kontot raderas omedelbart.
FRSH Nearby kan fortsätta lagra information när detta är nödvändigt för att uppfylla lagstadgade bokförings- eller skattekrav, slutföra utestående transaktioner, hantera tvister, förebygga bedrägerier, genomdriva avtal, skydda rättsliga rättigheter eller uppfylla andra tillämpliga rättsliga förpliktelser.
Information som inte längre behöver lagras kommer att raderas eller anonymiseras i enlighet med FRSH Nearbys rutiner för lagring.

18. Den registrerades rättigheter
Med förbehåll för kraven och begränsningarna i tillämplig lagstiftning kan den registrerade ha rätt att:
•	få tillgång till personuppgifter som rör honom eller henne;
•	begära rättelse av felaktiga eller ofullständiga personuppgifter;
•	begära radering av personuppgifter;
•	begära begränsning av behandlingen;
•	invända mot behandling som grundar sig på berättigade intressen;
•	när som helst invända mot behandling av personuppgifter för direktmarknadsföring;
•	få tillämpliga personuppgifter i ett strukturerat, allmänt använt och maskinläsbart format och överföra dessa till en annan personuppgiftsansvarig;
•	återkalla samtycke när behandlingen grundar sig på samtycke; och
•	utöva rättigheter som gäller automatiserat beslutsfattande när sådana rättigheter är tillämpliga.
Utövandet av en rättighet kan bero på omständigheterna och den rättsliga grunden för behandlingen. Exempelvis innebär rätten till radering inte att FRSH Nearby måste radera information som måste bevaras på grund av en rättslig förpliktelse.
FRSH Nearby kan begära information som rimligen behövs för att verifiera identiteten på den person som gör en begäran enligt dataskyddslagstiftningen.
Begäranden kan lämnas in med hjälp av kontaktuppgifterna i avsnitt 1.
19. Återkallande av samtycke
När behandling grundar sig på samtycke kan den registrerade när som helst återkalla sitt samtycke.
Beroende på behandlingen kan samtycket återkallas genom kontoinställningar, enhetens behörighetsinställningar, cookieinställningar, en avregistreringsfunktion eller genom att kontakta FRSH Nearby.
Återkallande av samtycke påverkar inte lagligheten av behandling som utförts innan samtycket återkallades.
När en viss valfri funktion är beroende av det aktuella samtycket kan funktionen bli otillgänglig efter att samtycket har återkallats.

20. Rätt att lämna in klagomål
En registrerad som anser att FRSH Nearby har behandlat personuppgifter i strid med tillämplig dataskyddslagstiftning har rätt att lämna in klagomål till en behörig tillsynsmyndighet för dataskydd.
För FRSH Nearbys verksamhet i Finland är den relevanta tillsynsmyndigheten Dataombudsmannens byrå.
Beroende på omständigheterna kan den registrerade även ha rätt att lämna in klagomål till tillsynsmyndigheten i en annan EU- eller EES-medlemsstat, inklusive den medlemsstat där den registrerade har sin stadigvarande bostad, arbetar eller där den påstådda överträdelsen har ägt rum.
Vi uppmuntrar användare att, när det är lämpligt, först kontakta FRSH Nearby så att vi får möjlighet att undersöka och hantera frågan.

21. Skyldighet att lämna personuppgifter
Vissa personuppgifter är nödvändiga för att FRSH Nearby ska kunna skapa ett konto, tillhandahålla Tjänsten, möjliggöra transaktioner eller uppfylla rättsliga förpliktelser.
Beroende på vilken Tjänst som används kan obligatoriska uppgifter omfatta identifierings- och kontaktuppgifter, kontouppgifter, orderinformation, leverans- eller avhämtningsinformation samt information som krävs för betalningsbehandling eller verifiering av Producenter.
Om information som är nödvändig för att tillhandahålla en tjänst inte lämnas kan FRSH Nearby vara oförmöget att skapa ett konto, tillhandahålla vissa funktioner, behandla en beställning, möjliggöra en betalning eller på annat sätt tillhandahålla den begärda Tjänsten.
Valfri information identifieras som sådan när det är lämpligt och användaren kan välja att inte lämna den.

22. Barn och minderåriga
Behörigheten att skapa ett konto och genomföra transaktioner via FRSH Nearby regleras av FRSH Nearbys användarvillkor och tillämplig lagstiftning.
FRSH Nearby försöker inte medvetet samla in personuppgifter från barn under omständigheter där sådan behandling inte skulle vara laglig.
När behandling av en minderårigs personuppgifter enligt tillämplig lagstiftning kräver samtycke eller godkännande från en förälder eller vårdnadshavare kan FRSH Nearby vidta rimliga åtgärder för att erhålla eller verifiera ett sådant samtycke eller godkännande.
Om FRSH Nearby får kännedom om att personuppgifter om ett barn har samlats in olagligt kommer lämpliga åtgärder att vidtas för att radera eller på annat lagligt sätt hantera informationen.

23. Skydd av personuppgifter
FRSH Nearby vidtar tekniska och organisatoriska åtgärder som är avsedda att skydda personuppgifter mot obehörig åtkomst, utlämnande, ändring, förlust, förstöring och annan olaglig behandling.
Åtgärderna kan omfatta kryptering under överföring, åtkomstkontroller, autentiseringsmekanismer, rollbaserade behörigheter, säker hantering av autentiseringsuppgifter, loggning, säkerhetskopiering, programvaruuppdateringar, övervakning, utvecklingsrutiner samt begränsningar av anställdas och underleverantörers åtkomst till personuppgifter.
Åtkomst till personuppgifter är avsedd att begränsas till personer som behöver sådan åtkomst för att utföra sina arbetsuppgifter.
Ingen onlinetjänst eller metod för elektronisk lagring kan garantera fullständig säkerhet. FRSH Nearby utvärderar och utvecklar därför kontinuerligt sina säkerhetsrutiner med hänsyn till Tjänstens natur och de risker som är förknippade med behandlingen.

24. Personuppgiftsincidenter
FRSH Nearby upprätthåller rutiner för att identifiera, bedöma och hantera misstänkta personuppgiftsincidenter.
När en personuppgiftsincident omfattas av en anmälningsskyldighet enligt tillämplig dataskyddslagstiftning kommer FRSH Nearby att underrätta den behöriga tillsynsmyndigheten och, när det krävs enligt lag, de berörda registrerade.

25. Tredjepartstjänster och externa länkar
Tjänsten kan innehålla länkar till webbplatser, karttjänster, betaltjänster, appbutiker, autentiseringstjänster eller andra tjänster som drivs av tredje parter.
När en person använder en tredjepartstjänst kan den tredje parten behandla personuppgifter enligt sina egna villkor och sin egen integritetspolicy.
FRSH Nearbys integritetspolicy gäller inte för behandling som självständigt utförs av sådana tredje parter.

26. Ändringar av ändamålen med behandlingen
Om FRSH Nearby avser att behandla personuppgifter för ett ändamål som väsentligt skiljer sig från det ändamål för vilket uppgifterna ursprungligen samlades in kommer FRSH Nearby att bedöma om den nya behandlingen är laglig och, när så krävs, lämna ytterligare information till berörda registrerade innan den nya behandlingen påbörjas.
Om den nya behandlingen kräver samtycke kommer FRSH Nearby att inhämta sådant samtycke innan behandlingen utförs.

27. Ändringar av denna integritetspolicy
FRSH Nearby kan ändra denna integritetspolicy för att återspegla förändringar i Tjänsten, behandlingsaktiviteter, tjänsteleverantörer, teknik, lagstiftning, myndighetsanvisningar eller affärsverksamheten.
Den vid var tid gällande versionen av integritetspolicyn kommer att göras tillgänglig via FRSH Nearbys webbplats och/eller applikation.
När ändringar väsentligt påverkar hur personuppgifter behandlas eller användarnas rättigheter kommer FRSH Nearby, när tillämplig lagstiftning kräver det, att lämna lämplig information innan ändringarna träder i kraft.
Datumet i början av denna integritetspolicy anger när policyn senast uppdaterades.

28. Kontakt
Frågor, begäranden och synpunkter som gäller integritet eller behandling av personuppgifter kan riktas till:
FRSH Nearby Ab
E-post: info@frshnearby.com
Postadress: Hovrättsesplanaden 23 A 20, 65100 Vasa, Finland.
''',
);
