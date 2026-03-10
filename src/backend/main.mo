import Map "mo:core/Map";
import Array "mo:core/Array";
import Order "mo:core/Order";
import Text "mo:core/Text";
import Runtime "mo:core/Runtime";
import Time "mo:core/Time";
import Principal "mo:core/Principal";
import Iter "mo:core/Iter";

actor {
  public type Lead = {
    id : Nat;
    name : Text;
    email : Text;
    company : Text;
    interestLevel : Text;
    timestamp : Int;
  };

  module Lead {
    public func compare(lead1 : Lead, lead2 : Lead) : Order.Order {
      if (lead1.timestamp < lead2.timestamp) {
        #less;
      } else if (lead1.timestamp > lead2.timestamp) {
        #greater;
      } else { #equal };
    };

    public func compareByTimestamp(lead1 : Lead, lead2 : Lead) : Order.Order {
      compare(lead1, lead2);
    };
  };

  type LeadHub = {
    leads : Map.Map<Nat, Lead>;
    nextLeadId : Nat;
  };

  public type LeadHubState = {
    leads : [(Nat, Lead)];
    nextLeadId : Nat;
  };

  let admin = Principal.fromText("2vxsx-fae");
  var state : ?LeadHub = null;

  func getState() : LeadHub {
    switch (state) {
      case (null) { Runtime.trap("Hub must be initialized first.") };
      case (?state) { state };
    };
  };

  func putState(state_ : LeadHub) {
    state := ?state_;
  };

  public shared ({ caller }) func initialize() : async () {
    assert (caller == admin);
    switch (state) {
      case (null) {};
      case (?_) { Runtime.trap("Hub is already initialized.") };
    };
    let initialState : LeadHub = {
      leads = Map.empty<Nat, Lead>();
      nextLeadId = 0;
    };
    putState(initialState);
  };

  func exists() : Bool {
    switch (state) {
      case (null) { false };
      case (?_) { true };
    };
  };

  func getNextEntryId() : Nat {
    let nextId = getState().nextLeadId;
    if (nextId >= 2 ** 63 - 1) {
      Runtime.trap("Maximum ID limit reached");
    };
    nextId;
  };

  func setEntryId(nextId : Nat) {
    let currentState = getState();
    let newState = {
      leads = currentState.leads;
      nextLeadId = nextId;
    };
    putState(newState);
  };

  public shared ({ caller }) func submitLead(name : Text, email : Text, company : Text, interestLevel : Text) : async () {
    if (not exists()) { await initialize() };
    let leadId = getNextEntryId();
    let newLead : Lead = {
      id = leadId;
      name;
      email;
      company;
      interestLevel;
      timestamp = Time.now();
    };
    let oldState = getState();
    oldState.leads.add(leadId, newLead);
    setEntryId(leadId + 1);
  };

  public query ({ caller }) func getAllLeads() : async [Lead] {
    if (caller != admin) {
      Runtime.trap("Only the admin can access all leads");
    };
    getState().leads.values().toArray();
  };

  public query ({ caller }) func getLeadsSortedByTimestamp() : async [Lead] {
    if (caller != admin) {
      Runtime.trap("Only the admin can access all leads");
    };
    getState().leads.values().toArray().sort(Lead.compareByTimestamp);
  };

  public query ({ caller }) func getLeadById(id : Nat) : async Lead {
    if (caller != admin) {
      Runtime.trap("Only the admin can access lead details");
    };
    switch (getState().leads.get(id)) {
      case (null) { Runtime.trap("Lead not found") };
      case (?lead) { lead };
    };
  };

  public query ({ caller }) func findLeadsByCompany(company : Text) : async [Lead] {
    if (caller != admin) {
      Runtime.trap("Only the admin can access lead details");
    };
    getState().leads.values().toArray().filter(
      func(lead) { lead.company.contains(#text company) }
    );
  };

  public query ({ caller }) func findLeadsByInterestLevel(level : Text) : async [Lead] {
    if (caller != admin) {
      Runtime.trap("Only the admin can access lead details");
    };
    getState().leads.values().toArray().filter(
      func(lead) { lead.interestLevel.contains(#text level) }
    );
  };
};
