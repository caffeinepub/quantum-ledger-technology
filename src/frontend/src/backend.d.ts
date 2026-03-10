import type { Principal } from "@icp-sdk/core/principal";
export interface Some<T> {
    __kind__: "Some";
    value: T;
}
export interface None {
    __kind__: "None";
}
export type Option<T> = Some<T> | None;
export interface Lead {
    id: bigint;
    name: string;
    email: string;
    company: string;
    timestamp: bigint;
    interestLevel: string;
}
export interface backendInterface {
    findLeadsByCompany(company: string): Promise<Array<Lead>>;
    findLeadsByInterestLevel(level: string): Promise<Array<Lead>>;
    getAllLeads(): Promise<Array<Lead>>;
    getLeadById(id: bigint): Promise<Lead>;
    getLeadsSortedByTimestamp(): Promise<Array<Lead>>;
    initialize(): Promise<void>;
    submitLead(name: string, email: string, company: string, interestLevel: string): Promise<void>;
}
